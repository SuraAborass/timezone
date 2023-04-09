import 'package:get/get.dart';

class OrderState {
  static String fromId(int id) {
    switch (id) {
      case 0:
        return "Received".tr;
      case 1:
        return "Under Audit".tr;
      case 2:
        return "In preparation".tr;
      case 3:
        return "In Delivery".tr;
      case 4:
        return "Delivered".tr;

      default:
        return "";
    }
  }
}
