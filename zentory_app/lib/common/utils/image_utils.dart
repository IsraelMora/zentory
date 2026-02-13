import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImageUtils {
  static Future<File?> compressImage(String filePath) async {
    final file = File(filePath);
    final sizeInBytes = await file.length();

    // Si la imagen es menor a 200KB, no comprimir más
    if (sizeInBytes < 200 * 1024) return file;

    final targetPath = p.join(
      (await getTemporaryDirectory()).path,
      "${DateTime.now().millisecondsSinceEpoch}.jpg",
    );

    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 80,
      minWidth: 1024,
      minHeight: 1024,
    );

    return result != null ? File(result.path) : null;
  }
}
