import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import 'package:timezone/main.dart';

import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/widgets/snackbars.dart';

class LoginController extends GetxController {
  var emailTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var passwordVisible = false.obs;
  var sending = false.obs;
  final UserController userController = Get.find();
  var repo = UserRepo();

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> login() async {
    sending.value = true;
    User? user = await repo.login(
        emailTextController.value.text, passwordTextController.value.text);
    if (user != null) {
      MyApp.AppUser = user;
      await userController.saveAuthState(user);
      SnackBars.showSuccess("Welcome  $user.name");
    } else {
      SnackBars.showError("Your Credentials Don't Match Our Record");
    }
    sending.value = false;
  }

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }
}
