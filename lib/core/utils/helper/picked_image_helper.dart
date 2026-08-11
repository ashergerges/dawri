// lib/core/utils/helper/picked_image_helper.dart
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

/// `image_picker` hands back files that live in the OS cache
/// (`.../cache/scaled_IMG-xxxx.jpg`). Android may evict that cache at any
/// moment, so a pick that is uploaded later — after the user finishes filling a
/// long form — can already be gone when Dio reads it, surfacing as
/// `PathNotFoundException: Cannot retrieve length of file`.
///
/// Copying the pick into the app's documents directory puts it out of the
/// cache's reach for the lifetime of the flow.
class PickedImageHelper {
  PickedImageHelper._();

  static const String _folderName = 'picked_images';

  /// Returns a durable copy of [picked]. Falls back to [picked] itself when the
  /// copy cannot be made (no space, unreadable source, …) so picking never
  /// fails outright.
  static Future<XFile> persist(XFile picked) async {
    try {
      final documents = await getApplicationDocumentsDirectory();
      final folder = Directory('${documents.path}/$_folderName');
      if (!folder.existsSync()) {
        await folder.create(recursive: true);
      }

      // Unique name per pick — `Image.file` caches by path, so reusing one
      // filename would keep showing the previous image.
      final copy = await File(picked.path).copy(
        '${folder.path}/${DateTime.now().microsecondsSinceEpoch}'
        '${_extension(picked.path)}',
      );
      await _pruneExcept(folder, copy.path);

      return XFile(copy.path, mimeType: picked.mimeType, name: picked.name);
    } catch (_) {
      return picked;
    }
  }

  /// Whether [file] is still readable — worth checking right before an upload.
  static Future<bool> exists(XFile? file) async =>
      file != null && await File(file.path).exists();

  /// Only the newest pick is ever in use, so earlier copies are dead weight.
  static Future<void> _pruneExcept(Directory folder, String keepPath) async {
    try {
      for (final entity in folder.listSync()) {
        if (entity is File && entity.path != keepPath) {
          await entity.delete();
        }
      }
    } catch (_) {
      // Housekeeping only — a failure here must not break the pick.
    }
  }

  static String _extension(String path) {
    final dot = path.lastIndexOf('.');
    final separator = path.lastIndexOf('/');
    return dot > separator && dot != -1 ? path.substring(dot) : '.jpg';
  }
}
