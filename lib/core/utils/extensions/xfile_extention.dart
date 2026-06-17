import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

extension XfileExtention on XFile {
  File get file => File(path);

  bool get isImageFile {
    String? mimeType = lookupMimeType(path);

    List<String> allowedMimeTypes = ['image/png', 'image/jpg', 'image/jpeg'];
    if (mimeType != null && allowedMimeTypes.contains(mimeType)) {
      return true;
    }
    return false;
  }

  bool get isDocFile {
    String? mimeType = lookupMimeType(path);
    List<String> allowedMimeTypes = [
      'application/pdf',
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    ];
    if (mimeType != null && allowedMimeTypes.contains(mimeType)) {
      return true;
    }
    return false;
  }

  bool get isVideoFile {
    String? mimeType = lookupMimeType(path);
    List<String> allowedMimeTypes = ['video/mp4', 'video/quicktime'];
    if (mimeType != null && allowedMimeTypes.contains(mimeType)) {
      return true;
    }
    return false;
  }

  Future<bool> get isFileSizeAcceptable async {
    var image = File(path);
    int fileSize = await image.length(); // Get file size in bytes
    int maxSize = 2 * 1024 * 1024; // 2 MB in bytes
    if (fileSize <= maxSize) {
      return true;
    }
    return false;
  }
}
