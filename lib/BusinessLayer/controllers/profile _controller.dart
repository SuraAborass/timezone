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
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updatePasswordController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateMobileNumberController = TextEditingController();
  // TextEditingController updateAddressController = TextEditingController();
  // TextEditingController updateAvatarController = TextEditingController();

  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  final UserController userController = Get.find();
  UserRepo userRepo = UserRepo();
  var loading = false.obs;
  @override
  void onInit() {
    if (MyApp.AppUser != null) {
      updateEmailController.text = MyApp.AppUser!.email;
      updateNameController.text = MyApp.AppUser!.name;
      updateMobileNumberController.text = MyApp.AppUser!.mobile_number;
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
    User? user;
      user = await userRepo.updateInfo(
        userController.user!.id,
        updateNameController.value.text,
        updateEmailController.value.text,
        updatePasswordController.value.text,
        updateMobileNumberController.value.text,
      );
    if (user != null) {
      print(user.toMap());
      await userController.saveAuthState(user);
      MyApp.AppUser = user;
      SnackBars.showSuccess("Successfully Saved ");
      update();
    }
  else {
      SnackBars.showError("There Was an Error ");
    }
    loading.value = false;
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    if(pickedImage!=null){
      pickedFile = File(pickedImage!.path);
    }
    setProfileImagePath(pickedFile!.path);
    Get.back();
  }

  void setProfileImagePath(String path){
    profilePicPath.value = path;
    isProfilePicPathSet.value = true;
  }
}
