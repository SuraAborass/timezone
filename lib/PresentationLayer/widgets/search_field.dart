import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/font_styles.dart';

import '../../Constants/colors.dart';
import '../../Constants/routes.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: TextFormField(
        style: title1.apply(color: Colors.white),
        onTap: () {
          Get.toNamed(AppRoutes.searchScreen);
        },
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintTextDirection: TextDirection.rtl,
            fillColor: AppColors.lightblack,
            prefixIcon: IconButton(
                icon: Icon(Icons.search),
                color: AppColors.grey2,
                onPressed: () {
                  Get.toNamed(AppRoutes.searchScreen);
                }),
            hintText: "Search For a Product , Category ,Brand",
            hintStyle: title1,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.grey2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: AppColors.grey2))),
      ),
    );
  }
}
