import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/routes.dart';

import '../../Constants/colors.dart';

PreferredSizeWidget myAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: AppColors.black,
    elevation: 0,
    leading: Builder(builder: (context) {
      return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.dehaze_outlined,
            size: 30,
            color: AppColors.yellow,
          ));
    }),
    title: Image.asset(
      'assets/images/logo-gold.png',
      height: 22,
      width: 119,
      alignment: Alignment.topLeft,
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () => Get.toNamed(AppRoutes.myBag),
          icon: const Icon(
            Icons.shopping_cart,
            size: 30,
            color: AppColors.grey3,
          ))
    ],
  );
}
