import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/widgets/snackbars.dart';

class RegisterController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var passwordVisible = false.obs;
  var sending = false.obs;
  final UserController userController = Get.find();
  var repo = UserRepo();

  @override
  void onInit() async {
    super.onInit();
  }

  Future<void> register() async {
    sending.value = true;
    User? user = await repo.register(
        nameController.value.text,
        emailController.value.text,
        passwordController.value.text);
    if (user != null) {
      await userController.saveAuthState(user);
      SnackBars.showSuccess("Welcome".tr);
    } else {
      SnackBars.showError("please fill required fields to continue".tr);
    }
    sending.value = false;
  }

  void togglePasswordVisible() {
    passwordVisible.value = !passwordVisible.value;
  }
}