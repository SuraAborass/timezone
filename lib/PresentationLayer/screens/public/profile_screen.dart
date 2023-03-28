import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:timezone/PresentationLayer/widgets/TZTextForm.dart';
import '../../../BusinessLayer/controllers/profile _controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/profile_image_and_name.dart';

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
                    title: CircleAvatar(
                      backgroundColor: AppColors.yellow,
                      radius: 55,
                      child: InkWell(
                        onTap: (){
                       showModalBottomSheet(context: context,
                           builder: (context)=> bottomSheet(context));
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage:
                          AssetImage(""),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("user name".tr,
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
                    hint: 'Your name here'.tr,
                    obsecure: false,
                    controller: _profileController.nameController),
                const SizedBox(height: 20),
                TZTextForm(
                    hint: 'example@gmail.com'.tr,
                    obsecure: false,
                    controller: _profileController.emailController),
                const SizedBox(height: 20),
                TZTextForm(
                    hint: 'Your phone number'.tr,
                    obsecure: false,
                    controller: _profileController.mobileNumber),
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
            child: Text("Profile photo",style: mediumBold ,textAlign: TextAlign.center,),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Expanded(flex: 1,
                child: ListTile(
                title: InkWell(onTap: (){
                  _profileController.takePhoto(ImageSource.camera);
                },
                    child: Icon(Icons.camera_alt_outlined,color: AppColors.grey3,size: 40,)),
                  subtitle: Text("Camera",style: mediumBold,textAlign: TextAlign.center,),
            )),
            Expanded(flex: 1,
                child: ListTile(
                  title: InkWell(onTap: (){
                    _profileController.takePhoto(ImageSource.gallery);
                  },
                      child: Icon(Icons.image,color: AppColors.grey3,size: 40,)),
                  subtitle: Text("Gallery",style: mediumBold,textAlign: TextAlign.center,),
                )),
          ],)
        ],
      ),

    );
  }
}
