import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/PresentationLayer/widgets/TZTextForm.dart';
import '../../../BusinessLayer/controllers/profile _controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: myAppBar(context),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                pageTitle("My Profile".tr),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: ListTile(
                    title: const CircleAvatar(
                      backgroundColor: AppColors.yellow,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage("assets/images/Mask Group 7.png"),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sura Aborass".tr,
                        style: mediumNormal.apply(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TZTextForm(
                    hint: 'Sura Aborass'.tr,
                    obsecure: false,
                    controller: _profileController.nameController),
                const SizedBox(height: 20),
                TZTextForm(
                    hint: 'Sura@gmail.com'.tr,
                    obsecure: false,
                    controller: _profileController.emailController),
                const SizedBox(height: 20),
                TZTextForm(
                    hint: 'Enter Your Password'.tr,
                    obsecure: true,
                    controller: _profileController.passwordController),
                const SizedBox(height: 20),
                TZTextForm(
                    hint: 'Enter Your Address'.tr,
                    obsecure: false,
                    controller: _profileController.addressController),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  height: 56,
                  minWidth: Get.width,
                  color: AppColors.yellow,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: Obx(() {
                    if (_profileController.loading.value) {
                      CircularProgressIndicator();
                    }
                    return Text('Update Profile Info'.tr,
                        style: mediumBold.apply(color: AppColors.black));
                  }),
                  onPressed: () async {
                    await _profileController.updateInfo();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
