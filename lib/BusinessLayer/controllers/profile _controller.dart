import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final UserController _userController = Get.find();
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

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
        mobileNumber.value.text);

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

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    //pickedFile = File();
  }
}
