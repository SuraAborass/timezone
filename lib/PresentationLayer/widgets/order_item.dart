import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/Helpers/order_state.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../Constants/routes.dart';
import '../../DataAccessLayer/Models/order.dart';

Widget orderItem(Order order) {
  return InkWell(
    onTap: () {
      Get.toNamed(AppRoutes.ordersScreen, arguments: [order]);
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration:
      const BoxDecoration(color: AppColors.black,
      borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: AppColors.lightblack,
              child: Text(
                order.id.toString(),
                style: title.copyWith(fontSize: 18),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(children: [
                       TextSpan(
                        text: "حالة الطلب : ",
                        style: title.copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text: OrderState.fromId(order.status),
                        style: title.copyWith(fontWeight: FontWeight.normal),
                      )
                    ]),
                  ),
                 const SizedBox(height: 10,),
                  RichText(
                    text: TextSpan(children: [
                       TextSpan(
                        text: "قيمة الطلب : ",
                        style: title.copyWith(fontSize: 14),
                      ),
                      TextSpan(
                        text: order.totalPrice.toString(),
                        style: title.copyWith(fontWeight: FontWeight.normal),
                      )
                    ]),
                  ),
                ],
              ))
        ],
      ),
    ),
  );
}