import 'package:get/get.dart';
import '../controllers/language_controller.dart';
import '../controllers/user_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
    Get.put<LanguageController>(LanguageController());
  }
}