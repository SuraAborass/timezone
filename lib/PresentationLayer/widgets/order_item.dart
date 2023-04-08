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
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
          color: AppColors.black1,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    color: AppColors.yellow,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text("#" + order.id.toString(),
                      textAlign: TextAlign.center,
                      style:
                          title.copyWith(fontSize: 18, color: AppColors.black)),
                ),
              )),
          SizedBox(
            width: 20,
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
                        style: bodyBold,
                      ),
                      TextSpan(
                        text: OrderState.fromId(order.status),
                        style: bodyNormal,
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "قيمة الطلب : ",
                        style: bodyBold,
                      ),
                      TextSpan(
                        text: order.totalPrice.toString(),
                        style: bodyNormal,
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
