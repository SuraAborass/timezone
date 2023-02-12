import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  final box = GetStorage();
  late String locale = "ar";

  @override
  void onInit() {
    super.onInit();
    Get.locale = box.read('locale') != null
        ? Locale.fromSubtags(languageCode: box.read('locale'))
        : Get.deviceLocale;
  }

  Future<void> saveLocale(String locale) async {
    box.write('locale', locale);
    Get.updateLocale(Locale.fromSubtags(languageCode: locale));
    update();
  }
}