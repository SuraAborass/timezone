import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import 'package:get/get.dart';

import '../screens/public/my_bag.dart';

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
    title: Image.asset('assets/images/logo-gold.png',
      height: 22,
      width: 119,
      alignment: Alignment.topLeft,
    ),
    centerTitle: true,
    actions: [
      IconButton(
          onPressed: () => Get.to(const MyBag()),
          icon: const Icon(
            Icons.shopping_cart,
            size: 30,
            color: AppColors.grey3,
          ))
    ],
  );
}