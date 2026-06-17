import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:dawri/gen/locale_keys.g.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import '../../utils/constants/check_internet_connection.dart';
import '../dialogs/message_service.dart';

@pragma('vm:entry-point')
class DownloadService {
  static bool _isInitialized = false;
  static final Map<String, DownloadItem> _downloadQueue = {};
  static final List<DownloadItem> _downloadHistory = [];
  static Function(List<DownloadItem>)? _onQueueUpdate;
  static Function(List<DownloadItem>)? _onHistoryUpdate;

  static Future<Directory> getDownloadsDirectory() async {
    try {
      Directory? downloadsDirectory;

      if (Platform.isAndroid) {
        downloadsDirectory = await getExternalStorageDirectory();
        downloadsDirectory ??= await getApplicationDocumentsDirectory();

        String downloadPath = '${downloadsDirectory.path}/nawy';
        downloadsDirectory = Directory(downloadPath);

        if (!await downloadsDirectory.exists()) {
          await downloadsDirectory.create(recursive: true);
        }

        log("Final download path: $downloadPath");
      } else if (Platform.isIOS) {
        downloadsDirectory = await getApplicationDocumentsDirectory();
        String downloadPath = '${downloadsDirectory.path}/nawy';
        downloadsDirectory = Directory(downloadPath);

        if (!await downloadsDirectory.exists()) {
          await downloadsDirectory.create(recursive: true);
        }
      } else {
        throw Exception("Unsupported platform");
      }

      return downloadsDirectory;
    } catch (e) {
      log("Error getting downloads directory: $e");
      // Fallback to default download directory
      return await getTemporaryDirectory();
    }
  }

  // static Future<bool> _requestPermissions() async {
  // if (Platform.isAndroid) {
  //   var status = await Permission.storage.status;
  //   if (!status.isGranted) {
  //     status = await Permission.storage.request();
  //     if (!status.isGranted) {
  //       return false;
  //     }
  //   }
  // }
  //   return true;
  // }

  // Single file download
  static Future<void> downloadFileExternal(
    BuildContext context,
    String url, {
    String? fileName,
    Function(int progress)? onProgress,
    Function(bool success)? onComplete,
  }) async {
    try {
      // bool hasPermission = await _requestPermissions();
      // if (!hasPermission) {
      //   MessageService.showToast(
      //       msg: LocaleKeys.storagePermissionRequiredForDownload.tr(),
      //       state: ToastStates.error
      //   );
      //   return;
      // }
      if(!(await checkInternetConnection())){
        MessageService.showToast(
          msg: LocaleKeys.noInternetConnection.tr(),
          state: ToastStates.error,
        );
        onComplete?.call(false);
        return;
      }
      if (!_isInitialized) {
        await downloadFilesInit();
      }

      // Validate URL
      if (url.isEmpty || !url.startsWith('http')) {
        MessageService.showToast(
          msg: LocaleKeys.invalidDownloadUrl.tr(),
          state: ToastStates.error,
        );
        return;
      }

      Directory downloadsDirectory = await getDownloadsDirectory();

      String finalFileName = _getFileNameFromUrl(url, fileName);
      log("Download URL: $url");
      log("Download Path: ${downloadsDirectory.path}/$finalFileName");

      final taskId = await FlutterDownloader.enqueue(
        url: url,
        fileName: finalFileName,
        savedDir: downloadsDirectory.path,
        showNotification: true,
        openFileFromNotification: true,
        requiresStorageNotLow: false,
        saveInPublicStorage: true,
      );

      if (taskId != null) {
        log("Download started with taskId: $taskId");

        // Add to download queue
        final downloadItem = DownloadItem(
          taskId: taskId,
          url: url,
          fileName: finalFileName,
          status: DownloadStatus.downloading,
          progress: 0,
          createdAt: DateTime.now(),
          onProgress: onProgress,
          onComplete: onComplete,
        );

        _downloadQueue[taskId] = downloadItem;
        _notifyQueueUpdate();

        MessageService.showToast(
          msg: LocaleKeys.downloadStarted.tr(),
          state: ToastStates.success,
        );
      } else {
        throw Exception("Failed to start download - taskId is null");
      }
    } on PlatformException catch (e) {
      log("PlatformException: $e");
      MessageService.showToast(
        msg: "${LocaleKeys.downloadFailed.tr()}: ${e.message}",
        state: ToastStates.error,
      );
    } catch (e) {
      log("Unexpected error: $e");
      MessageService.showToast(
        msg: "${LocaleKeys.downloadFailed.tr()}: $e",
        state: ToastStates.error,
      );
    }
  }

  // Download with progress tracking
  static Future<void> downloadFileWithProgress(
    BuildContext context,
    String url,
    String? fileTitle, {
    String? fileName,
    Function(int progress)? onProgress,
    Function(bool success)? onComplete,
  }) async {
    try {
      // bool hasPermission = await _requestPermissions();
      // if (!hasPermission) {
      //   onComplete?.call(false);
      //   return;
      // }

      if (!_isInitialized) {
        await downloadFilesInit();
      }

      Directory downloadsDirectory = await getDownloadsDirectory();
      String finalFileName = _getFileNameFromUrl(url, fileTitle);

      final taskId = await FlutterDownloader.enqueue(
        url: url,
        fileName: finalFileName,
        savedDir: downloadsDirectory.path,
        showNotification: true,
        openFileFromNotification: true,
      );

      if (taskId != null) {
        final downloadItem = DownloadItem(
          taskId: taskId,
          url: url,
          fileName: finalFileName,
          status: DownloadStatus.downloading,
          progress: 0,
          createdAt: DateTime.now(),
          onProgress: onProgress,
          onComplete: onComplete,
        );

        _downloadQueue[taskId] = downloadItem;
        _notifyQueueUpdate();
      } else {
        onComplete?.call(false);
      }
    } catch (e) {
      log("Download error: $e");
      onComplete?.call(false);
    }
  }

  static String _getFileNameFromUrl(String url, String? fileTitle) {
    try {
      String fileName = url.split("/").last;

      if (fileName.isEmpty || !fileName.contains('.')) {
        String extension = "pdf";
        if (url.toLowerCase().contains('.pdf'))
          extension = "pdf";
        else if (url.toLowerCase().contains('.doc'))
          extension = "doc";
        else if (url.toLowerCase().contains('.xls'))
          extension = "xlsx";
        else if (url.toLowerCase().contains('.jpg') ||
            url.toLowerCase().contains('.jpeg'))
          extension = "jpg";
        else if (url.toLowerCase().contains('.png'))
          extension = "png";

        return "$fileTitle${DateTime.now().millisecondsSinceEpoch}.$extension";
      }

      fileName = fileName.split('?').first;
      return "$fileTitle${DateTime.now().millisecondsSinceEpoch}_$fileName";
    } catch (e) {
      return "$fileTitle${DateTime.now().millisecondsSinceEpoch}.pdf";
    }
  }

  static Future downloadFilesInit() async {
    if (_isInitialized) return;

    WidgetsFlutterBinding.ensureInitialized();

    try {
      await FlutterDownloader.initialize(debug: kDebugMode, ignoreSsl: true);

      final ReceivePort port = ReceivePort();
      IsolateNameServer.removePortNameMapping('downloader_send_port');
      IsolateNameServer.registerPortWithName(
        port.sendPort,
        'downloader_send_port',
      );

      port.listen((dynamic data) async {
        log("Download callback data: $data");

        if (data is List && data.length >= 3) {
          String id = data[0] as String;
          int rawStatus = data[1] as int;
          int progress = data[2] as int;

          final DownloadTaskStatus status = DownloadTaskStatus.fromInt(
            rawStatus,
          );
          log(
            "Download update - id: $id, status: $status, progress: $progress",
          );

          // Update download queue
          if (_downloadQueue.containsKey(id)) {
            var item = _downloadQueue[id]!;
            item.progress = progress;

            // Call progress callback
            item.onProgress?.call(progress);

            if (status == DownloadTaskStatus.complete) {
              item.status = DownloadStatus.completed;
              item.completedAt = DateTime.now();

              // Move to history
              _downloadHistory.add(item);
              _downloadQueue.remove(id);

              _notifyQueueUpdate();
              _notifyHistoryUpdate();

              // Call completion callback


              try {
                var tasks = await FlutterDownloader.loadTasksWithRawQuery(
                  query: "SELECT * FROM task WHERE task_id='$id'",
                );

                if (tasks != null && tasks.isNotEmpty) {
                  item.onComplete?.call(true);
                }
              } catch (e) {
                log("Error loading completed task: $e");
              }
            } else if (status == DownloadTaskStatus.failed) {
              item.status = DownloadStatus.failed;
              item.onComplete?.call(false);

            } else if (status == DownloadTaskStatus.canceled) {
              item.status = DownloadStatus.cancelled;
              _downloadQueue.remove(id);
              _notifyQueueUpdate();
            } else if (status == DownloadTaskStatus.paused) {
              item.status = DownloadStatus.paused;
            } else if (status == DownloadTaskStatus.running) {
              item.status = DownloadStatus.downloading;
            }

            _notifyQueueUpdate();
          }
        }
      });

      FlutterDownloader.registerCallback(DownloadService.downloadCallback);
      _isInitialized = true;
      log("FlutterDownloader initialized successfully");

      // Load existing tasks
      await _loadExistingTasks();
    } catch (e) {
      log("Failed to initialize FlutterDownloader: $e");
    }
  }

  static Future<void> _loadExistingTasks() async {
    try {
      final tasks = await FlutterDownloader.loadTasks();
      if (tasks != null) {
        for (var task in tasks) {
          if (task.status == DownloadTaskStatus.running ||
              task.status == DownloadTaskStatus.paused ||
              task.status == DownloadTaskStatus.enqueued) {
            _downloadQueue[task.taskId] = DownloadItem(
              taskId: task.taskId,
              url: task.url,
              fileName: task.filename ?? "",
              status: _convertTaskStatus(task.status),
              progress: task.progress,
              createdAt: DateTime.now(),
            );
          } else if (task.status == DownloadTaskStatus.complete) {
            _downloadHistory.add(
              DownloadItem(
                taskId: task.taskId,
                url: task.url,
                fileName: task.filename ?? "",
                status: DownloadStatus.completed,
                progress: 100,
                createdAt: DateTime.now(),
                completedAt: DateTime.now(),
              ),
            );
          }
        }
        _notifyQueueUpdate();
        _notifyHistoryUpdate();
      }
    } catch (e) {
      log("Error loading existing tasks: $e");
    }
  }

  static DownloadStatus _convertTaskStatus(DownloadTaskStatus taskStatus) {
    switch (taskStatus) {
      case DownloadTaskStatus.undefined:
        return DownloadStatus.pending;
      case DownloadTaskStatus.enqueued:
        return DownloadStatus.downloading;
      case DownloadTaskStatus.running:
        return DownloadStatus.downloading;
      case DownloadTaskStatus.complete:
        return DownloadStatus.completed;
      case DownloadTaskStatus.failed:
        return DownloadStatus.failed;
      case DownloadTaskStatus.canceled:
        return DownloadStatus.cancelled;
      case DownloadTaskStatus.paused:
        return DownloadStatus.paused;
      }
  }

  // CRITICAL FIX: Add proper annotation for native code access
  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    log("Native callback - id: $id, status: $status, progress: $progress");
    final SendPort? send = IsolateNameServer.lookupPortByName(
      'downloader_send_port',
    );
    if (send != null) {
      send.send([id, status, progress]);
    } else {
      log("SendPort not found for download callback");
    }
  }

  // Queue management methods
  static List<DownloadItem> getDownloadQueue() {
    return _downloadQueue.values.toList();
  }

  static List<DownloadItem> getDownloadHistory() {
    return _downloadHistory;
  }

  static void setQueueUpdateListener(Function(List<DownloadItem>) listener) {
    _onQueueUpdate = listener;
  }

  static void setHistoryUpdateListener(Function(List<DownloadItem>) listener) {
    _onHistoryUpdate = listener;
  }

  static void _notifyQueueUpdate() {
    _onQueueUpdate?.call(getDownloadQueue());
  }

  static void _notifyHistoryUpdate() {
    _onHistoryUpdate?.call(getDownloadHistory());
  }

  // Control methods
  static Future<void> pauseDownload(String taskId) async {
    await FlutterDownloader.pause(taskId: taskId);
  }

  static Future<void> resumeDownload(String taskId) async {
    await FlutterDownloader.resume(taskId: taskId);
  }

  static Future<void> cancelDownload(String taskId) async {
    await FlutterDownloader.cancel(taskId: taskId);
    _downloadQueue.remove(taskId);
    _notifyQueueUpdate();
  }

  static Future<void> retryDownload(String taskId) async {
    await FlutterDownloader.retry(taskId: taskId);
  }

  static Future<void> removeFromHistory(DownloadItem item) async {
    _downloadHistory.remove(item);
    _notifyHistoryUpdate();

    // Optionally delete the file
    try {
      final directory = await getDownloadsDirectory();
      final file = File('${directory.path}/${item.fileName}');
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      log("Error deleting file: $e");
    }
  }

  static Future<void> checkAndVerifyDownloads() async {
    try {
      final tasks = await FlutterDownloader.loadTasks();
      if (tasks != null) {
        log("Current download tasks: ${tasks.length}");
        for (var task in tasks) {
          log("Task: ${task.taskId}");
          log("Status: ${task.status}");
          log("Progress: ${task.progress}");
          log("File: ${task.filename}");
          log("Saved Dir: ${task.savedDir}");

          if (task.status == DownloadTaskStatus.complete) {
            final file = File('${task.savedDir}/${task.filename}');
            bool exists = await file.exists();
            log("File exists: $exists");
            if (exists) {
              log("File size: ${await file.length()} bytes");
            }
          }
        }
      }
    } catch (e) {
      log("Error checking downloads: $e");
    }
  }

  // Method to open downloaded file
  static Future<void> openDownloadedFile(String taskId) async {
    try {
      await FlutterDownloader.open(taskId: taskId);
    } catch (e) {
      log("Error opening file: $e");
      MessageService.showToast(
        msg: LocaleKeys.cannotOpenFile.tr(),
        state: ToastStates.error,
      );
    }
  }

  static void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _isInitialized = false;
    _onQueueUpdate = null;
    _onHistoryUpdate = null;
    _downloadQueue.clear();
    _downloadHistory.clear();
  }
}

// Data models
class DownloadRequest {
  final String url;
  final String? fileName;

  DownloadRequest({required this.url, this.fileName});
}

class DownloadItem {
  final String taskId;
  final String url;
  final String fileName;
  DownloadStatus status;
  int progress;
  final DateTime createdAt;
  DateTime? completedAt;
  final Function(int progress)? onProgress;
  final Function(bool success)? onComplete;

  DownloadItem({
    required this.taskId,
    required this.url,
    required this.fileName,
    required this.status,
    required this.progress,
    required this.createdAt,
    this.completedAt,
    this.onProgress,
    this.onComplete,
  });
}

enum DownloadStatus {
  pending,
  downloading,
  paused,
  completed,
  failed,
  cancelled,
}
