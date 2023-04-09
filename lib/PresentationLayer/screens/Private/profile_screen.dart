import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timezone/PresentationLayer/widgets/Public/loading_item.dart';
import 'package:timezone/PresentationLayer/widgets/TZTextForm.dart';
import 'package:timezone/main.dart';

import '../../../BusinessLayer/controllers/profile _controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../../DataAccessLayer/Models/user.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  User? user;
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: myAppBar(context),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GetBuilder(
                init: _profileController,
                builder: (_) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      pageTitle("My Profile".tr),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: ListTile(
                          title: Center(
                            child: Stack(children: [
                              CircleAvatar(
                                backgroundColor: AppColors.yellow,
                                radius: 65,
                                child: CircleAvatar(
                                    backgroundColor: AppColors.lightblack,
                                    radius: 60,
                                    backgroundImage: _profileController
                                                .isProfilePicPathSet.value ==
                                            true
                                        ? FileImage(File(_profileController
                                            .profilePicPath
                                            .value)) as ImageProvider
                                        : CachedNetworkImageProvider(
                                            MyApp.AppUser!.avatar)),
                              ),
                              Positioned(
                                bottom: 0,
                                child: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              bottomSheet(context));
                                    },
                                    icon: Icon(
                                      Icons.add_a_photo_sharp,
                                      size: 30,
                                      color: AppColors.white,
                                    )),
                              )
                            ]),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              MyApp.AppUser!.name,
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
                          label: "name".tr,
                          hint: 'Enter your name'.tr,
                          obsecure: false,
                          type: TextInputType.name,
                          controller: _profileController.updateNameController),
                      const SizedBox(height: 20),
                      TZTextForm(
                          label: "email".tr,
                          hint: 'Enter your email'.tr,
                          type: TextInputType.emailAddress,
                          obsecure: false,
                          controller: _profileController.updateEmailController),
                      const SizedBox(height: 20),
                      TZTextForm(
                          label: "mobile".tr,
                          hint: 'Enter your phone number'.tr,
                          type: TextInputType.phone,
                          obsecure: false,
                          controller:
                              _profileController.updateMobileController),
                      const SizedBox(height: 20),
                      TZTextForm(
                          label: "password".tr,
                          hint: 'Enter anew password'.tr,
                          obsecure: true,
                          controller:
                              _profileController.updatePasswordController),
                      const SizedBox(height: 20),
                      TZTextForm(
                          label: "address".tr,
                          hint: 'Enter your address'.tr,
                          type: TextInputType.streetAddress,
                          obsecure: false,
                          controller:
                              _profileController.updateAddressController),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        height: 56,
                        minWidth: Get.width,
                        color: AppColors.yellow,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Obx(() {
                          if (_profileController.loading.value == true) {
                            loadingItem(false);
                          }
                          return Text('Update Profile Info'.tr,
                              style: mediumBold.apply(color: AppColors.black));
                        }),
                        onPressed: () async {
                          await _profileController.updateInfo();
                        },
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
      color: AppColors.black,
      height: 120,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Choose profile photo",
              style: mediumBold,
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: ListTile(
                    title: InkWell(
                        onTap: () {
                          _profileController.takePhoto(ImageSource.camera);
                        },
                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: AppColors.grey3,
                          size: 40,
                        )),
                    subtitle: Text(
                      "Camera",
                      style: mediumBold,
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: ListTile(
                    title: InkWell(
                        onTap: () {
                          _profileController.takePhoto(ImageSource.gallery);
                        },
                        child: Icon(
                          Icons.image,
                          color: AppColors.grey3,
                          size: 40,
                        )),
                    subtitle: Text(
                      "Gallery",
                      style: mediumBold,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
