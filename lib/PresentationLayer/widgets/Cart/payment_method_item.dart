import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';


Widget paymentMethodItem(IconData icon, String text, bool selected) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: selected ? AppColors.white : AppColors.lightgrey,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 30,
          color: selected ? AppColors.grey3 : AppColors.black,
        ),
        Text(
          text,
          style: bodyNormal.apply(
            fontSizeDelta: 2,
              color: selected ? AppColors.lightblack : AppColors.white,
              fontWeightDelta: selected ? 2 : 1),
        )
      ],
    ),
  );
}
