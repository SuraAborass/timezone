import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';

import '../../Constants/routes.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/widgets/snackbars.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  final UserController _userController = Get.find();

  UserRepo userRepo = UserRepo();
  var loading = false.obs;
  @override
  void onInit() {
    if (_userController.user != null) {
      emailController.text = _userController.user!.email;
      nameController.text = _userController.user!.name;
    }
    super.onInit();
  }

  Future<void> logout() async {
    _userController.box.remove('user');
    _userController.box.remove('authed');
    _userController.user = null;
    _userController.update();
    Get.toNamed(AppRoutes.loginPage);
  }

  Future<void> updateInfo() async {
    print("start Updating ");
    loading.value = true;
    User? user = await userRepo.updateInfo(
      _userController.user!.id,
      nameController.value.text,
      emailController.value.text,
      passwordController.value.text,
    );

    if (user != null) {
      print(user.toMap());
      await _userController.saveAuthState(user);
      SnackBars.showSuccess("Successfully Saved ");
    } else {
      SnackBars.showError("There Was an Error ");
    }
    loading.value = false;
  }
}
