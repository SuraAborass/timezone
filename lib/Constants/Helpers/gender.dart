import 'package:get/get.dart';

class Gender{
  static String getGender(int gender) {
    if (gender == 1) return 'woman'.tr;
    return 'men'.tr;
  }
}

