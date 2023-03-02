import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/routes.dart';
import '../../BusinessLayer/controllers/language_controller.dart';
import '../../BusinessLayer/controllers/user_controller.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../screens/public/TopCategories_screen.dart';
import '../screens/public/profile_screen.dart';



class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);
  final LanguageController _languageController = Get.find();
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.yellow),
            accountName: Text(
                userController.user != null
                    ? userController.user!.name
                    : "TimeZone User",
                style: title.copyWith(color: AppColors.black)),
            accountEmail: Text(
              userController.user != null
                  ? userController.user!.email
                  : "",
              style:title.copyWith(fontSize: 14,color: AppColors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.black,
              backgroundImage: userController.user != null
                  ? NetworkImage(userController.user!.avatar)
                  : null,
            ),
          ),
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: AppColors.grey,
          //   ),
          //   child:  Text("Sura Aborass",style: title5,),
          // ),
          ListTile(
            leading: const Icon(Icons.home,color: AppColors.white,),
            title: Text('Home'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () => Get.toNamed(AppRoutes.homepage),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: AppColors.white,),
            title: Text("Profile".tr,style: title.copyWith(fontSize: 14),),
            onTap: ()=> Get.to(Profile()),
          ),
          ListTile(
            leading: const Icon(Icons.category,color: AppColors.white,),
            title: Text('Top Categories'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () => Get.to(TopCategories()),
          ),
          ListTile(
            leading: const Icon(Icons.branding_watermark,color: AppColors.white,),
            title: Text('Top Brands'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.featured_play_list,color: AppColors.white,),
            title: Text('Featured Products'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.language,color: AppColors.white),
            title: Text('Language'.tr,style: title.copyWith(fontSize: 14)),
            onTap: () {
              Get.defaultDialog(
                  title: 'Choose Language'.tr,
                  titleStyle: title.copyWith(color: AppColors.black),
                  content: Column(
                    children: [
                      ListTile(
                        title: Text("Arabic".tr),
                        onTap: () {
                          _languageController.saveLocale("ar");
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: Text("English".tr),
                        onTap: () {
                          _languageController.saveLocale("en");
                          Get.back();
                        },
                      )
                    ],
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.roundabout_left, color: AppColors.white,),
            title: Text("About Us".tr,style: title.copyWith(fontSize: 14),),
          ),
        ],
      ),
    );
  }
}
