import 'package:flutter/material.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';

Widget paymentMethodItem(Widget icon, String text, bool selected) {
  return Container(
    margin: const EdgeInsets.only(left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: selected ? AppColors.white : AppColors.grey,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Text(
          text,
          style: bodyNormal.apply(
              fontSizeDelta: 2,
              color: selected ? AppColors.black : AppColors.white,
              fontWeightDelta: selected ? 2 : 1),
        )
      ],
    ),
  );
}
