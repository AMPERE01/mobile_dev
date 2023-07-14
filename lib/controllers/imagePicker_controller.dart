import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../screen/theme/theme.dart';

class ImagePickerController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final RxString imagePath = ''.obs;
  File? pickedImageFile;

  Future<void> takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final File file = File(pickedFile.path) ;

        imagePath.value = pickedFile.path;
        var data = await rootBundle.load('${imagePath.value}');
        final Uint8List? result = await Navigator.push<Uint8List?>(
          Get.context!,
          MaterialPageRoute(
            builder: (context) => ImageEditor(image: data.buffer.asUint8List()),
          ),
        );
        if (result != null) {
          File imageFile = await convertUint8ListToFile(result);
          await saveImageToGallery(imageFile);
        }
    }
  }

  Future<File> convertUint8ListToFile(Uint8List imageBytes) async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    String filePath = '$tempPath/image.jpg';

    File file = File(filePath);
    await file.writeAsBytes(imageBytes);
    return file;
  }

  Future<void> saveImageToGallery(File imageFile) async {
    await GallerySaver.saveImage(imageFile.path).then(
      (value) {
        if (value == true) {
          Get.snackbar('Success', 'Image saved to gallery',
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
              colorText: white,
              snackPosition: SnackPosition.BOTTOM);
        } else {
          Get.snackbar('Error', 'Failed to save image',
              duration: Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: white,
              snackPosition: SnackPosition.BOTTOM);
        }
      },
    );
  }
}
