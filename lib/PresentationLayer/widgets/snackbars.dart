import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';

class SnackBars {
  static void showSuccess(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: titleCopy7.apply(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.success);
  }

  static void showError(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: titleCopy7.apply(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.error);
  }

  static void showWarning(message) {
    Get.rawSnackbar(
        padding: const EdgeInsets.symmetric(vertical: 15),
        messageText: Text(
          message,
          style: titleCopy7.apply(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColors.error);
  }
}
