import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import '../../Constants/routes.dart';
import '../../DataAccessLayer/Clients/box_client.dart';
import '../../DataAccessLayer/Models/user.dart';
import '../../DataAccessLayer/Repositories/user_repo.dart';
import '../../PresentationLayer/widgets/snackbars.dart';
import '../../main.dart';

class ProfileController extends GetxController {
  UserRepo userRepo = UserRepo();
  BoxClient boxClient = BoxClient();
  TextEditingController updateNameController =
  TextEditingController(text: MyApp.AppUser!.name);
  TextEditingController updateEmailController =
  TextEditingController(text: MyApp.AppUser!.email);
  TextEditingController updatePasswordController =
  TextEditingController(text: '********');
  TextEditingController updateAddressController =
  TextEditingController(text: MyApp.AppUser!.address);
  TextEditingController updateMobileController =
  TextEditingController(text: MyApp.AppUser!.mobile_number);
  var loading = false.obs;
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  Future<void> updateInfo() async {
    User? user;
    String name = updateNameController.value.text;
    String email = updateEmailController.value.text;
    String password = updatePasswordController.value.text;
    String address = updateAddressController.value.text;
    String mobileNumber = updateMobileController.value.text;
    if (email.isNotEmpty) {
      if (name.isNotEmpty) {
        user = await userRepo.updateInfo(
            MyApp.AppUser!.id, name, email, password, address, mobileNumber);
      } else {
        user = await userRepo.updateInfo(MyApp.AppUser!.id, MyApp.AppUser!.name,
            email, password, address, mobileNumber);
      }
      if (user != null) {
        MyApp.AppUser = user;
        await boxClient.setAuthedUser(user);
        SnackBars.showSuccess('your information updated successfully'.tr);
        update();
      }
    } else {
      SnackBars.showWarning('please fill required field to continue'.tr);
    }
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
