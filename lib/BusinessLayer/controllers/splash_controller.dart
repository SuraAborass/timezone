import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import '../../Constants/routes.dart';

class SplashController extends GetxController {
  UserController userController = Get.find();

  @override
  void onReady() {
    if (userController.authed == true) {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoutes.homepage));
      ;
    } else {
      Future.delayed(const Duration(seconds: 3))
          .then((value) => Get.toNamed(AppRoutes.register));
    }
    super.onReady();
  }
}
