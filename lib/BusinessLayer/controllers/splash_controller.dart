import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import 'package:timezone/main.dart';

import '../../Constants/routes.dart';

class SplashController extends GetxController {
  UserController userController = Get.find();

  @override
  void onReady() {
    if (userController.authed == true) {
      if (userController.user != null) {
        MyApp.AppUser = userController.user;
      }

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
