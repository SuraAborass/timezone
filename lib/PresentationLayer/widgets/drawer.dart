import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/user_controller.dart';
import 'package:timezone/Constants/routes.dart';
import 'package:timezone/main.dart';

import '../../BusinessLayer/controllers/language_controller.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../screens/public/Brands_screen.dart';
import '../screens/public/TopCategories_screen.dart';
import '../screens/public/featuredProducts_screen.dart';
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
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: AppColors.yellow),
            accountName: Text(
                MyApp.AppUser != null ? MyApp.AppUser!.name : "TimeZone User",
                style: title.copyWith(color: AppColors.black)),
            accountEmail: Text(
              MyApp.AppUser != null ? MyApp.AppUser!.email : "",
              style: title.copyWith(fontSize: 14, color: AppColors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.black,
              backgroundImage: MyApp.AppUser != null
                  ? NetworkImage(MyApp.AppUser!.avatar)
                  : null,
            ),
          ),
          // const DrawerHeader(
          //   decoration: BoxDecoration(
          //     color: AppColors.grey,
          //   ),
          //   child:  Text("Sura Aborass",style: title5,),
          // ),

          if (MyApp.AppUser == null)
            ListTile(
              leading: const Icon(
                Icons.login,
                color: AppColors.white,
              ),
              title: Text('Login'.tr, style: title.copyWith(fontSize: 14)),
              onTap: () => Get.toNamed(AppRoutes.loginPage),
            ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: AppColors.white,
            ),
            title: Text('Home'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () => Get.toNamed(AppRoutes.homepage),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: AppColors.white,
            ),
            title: Text(
              "Profile".tr,
              style: title.copyWith(fontSize: 14),
            ),
            onTap: () => Get.to(Profile()),
          ),
          ListTile(
            leading: const Icon(
              Icons.category,
              color: AppColors.white,
            ),
            title:
                Text('Top Categories'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () => Get.to(TopCategories()),
          ),
          ListTile(
            leading: const Icon(
              Icons.stacked_line_chart,
              color: AppColors.white,
            ),
            title: Text('Top Brands'.tr, style: title.copyWith(fontSize: 14)),
            onTap: () => Get.to(BrandScreen()),
          ),
          ListTile(
              leading: const Icon(
                Icons.star,
                color: AppColors.white,
              ),
              title: Text('Featured Products'.tr,
                  style: title.copyWith(fontSize: 14)),
              onTap: () => Get.to(FeaturedProducts())),
          ListTile(
            leading: const Icon(Icons.language, color: AppColors.white),
            title: Text('Language'.tr, style: title.copyWith(fontSize: 14)),
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
            leading: const Icon(
              Icons.roundabout_left,
              color: AppColors.white,
            ),
            title: Text(
              "About Us".tr,
              style: title.copyWith(fontSize: 14),
            ),
          ),
          if (MyApp.AppUser != null)
            ListTile(
              onTap: () async {
                await userController.logout();
              },
              leading: const Icon(
                Icons.logout,
                color: AppColors.white,
              ),
              title: Text(
                "logout".tr,
                style: title.copyWith(fontSize: 14),
              ),
            ),
        ],
      ),
    );
  }
}
