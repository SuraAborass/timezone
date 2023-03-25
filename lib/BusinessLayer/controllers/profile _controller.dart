import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';

import '../../Constants/routes.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/widgets/snackbars.dart';
import '../../main.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  final UserController userController = Get.find();
  UserRepo userRepo = UserRepo();
  var loading = false.obs;
  @override
  void onInit() {
    if (MyApp.AppUser != null) {
      emailController.text = MyApp.AppUser!.email;
      nameController.text = MyApp.AppUser!.name;
    }
    super.onInit();
  }

  Future<void> logout() async {
    userController.box.remove('user');
    userController.box.remove('authed');
    userController.user = null;
    userController.update();
    Get.toNamed(AppRoutes.loginPage);
  }

  Future<void> updateInfo() async {
    print("start Updating ");
    loading.value = true;
    User? user = await userRepo.updateInfo(
      userController.user!.id,
      nameController.value.text,
      emailController.value.text,
      passwordController.value.text,
    );

    if (user != null) {
      print(user.toMap());
      await userController.saveAuthState(user);
      MyApp.AppUser = user;
      SnackBars.showSuccess("Successfully Saved ");
    } else {
      SnackBars.showError("There Was an Error ");
    }
    loading.value = false;
  }
}
