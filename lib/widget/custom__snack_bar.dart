import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBarController extends GetxController {
  void showSuccessSnackBar({required String title, String message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10));
  }

  void showErrorSnackBar({required String title, String message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10));
  }

  void showInfoSnackBar({required String title, String message = ""}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10));
  }
}
