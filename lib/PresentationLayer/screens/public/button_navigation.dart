import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/PresentationLayer/screens/public/profile_screen.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/routes.dart';
import '../../../main.dart';
import 'favorites_screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: MyApp.currentPage,
      onTap: (index) {
        MyApp.currentPage = index;
        switch (index) {
          case 0:
            Get.toNamed(AppRoutes.homepage);
            break;
          case 1:
            Get.toNamed(AppRoutes.notifications);
            break;
          case 2:
            Get.toNamed(AppRoutes.myBag);
            break;
          case 3:
            Get.to(Favorites());
            break;
          case 4:
            Get.to(Profile());
            break;
          default:
        }
      },
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: Colors.white.withOpacity(.5),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: AppColors.lightblack,
          icon: const Icon(Icons.home),
          label: "Home".tr,
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.lightblack,
          icon: const Icon(Icons.notifications),
          label: "Notifications".tr,
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.lightblack,
          icon: const Icon(Icons.shopping_cart),
          label: "My Bag".tr,
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.lightblack,
          icon: const Icon(Icons.favorite),
          label: "Favourites".tr,
        ),
        BottomNavigationBarItem(
          backgroundColor: AppColors.lightblack,
          icon: const Icon(Icons.person),
          label: "Profile".tr,
        ),
      ],
    );
  }
}
