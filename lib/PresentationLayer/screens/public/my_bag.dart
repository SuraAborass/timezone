import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/cart_controller.dart';
import 'package:timezone/Constants/routes.dart';
import 'package:timezone/PresentationLayer/widgets/product_cart_item.dart';

import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';

class MyBag extends StatelessWidget {
  MyBag({Key? key}) : super(key: key);
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: myAppBar(context),
        drawer: MyDrawer(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
              init: cartController,
              builder: (context) {
                return Container(
                  height: 180,
                  color: AppColors.black,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total :".tr,
                                    style: titleCopy7.copyWith(fontSize: 15),
                                  ),
                                  Text(cartController.totalValue.toString(),
                                      style: title8.copyWith(fontSize: 15))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (cartController.discount != 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Discount :    ".tr,
                                      style: titleCopy7.copyWith(fontSize: 15),
                                    ),
                                    Text(cartController.discount.toString(),
                                        style: title7.copyWith(
                                            fontSize: 15, color: Colors.red))
                                  ],
                                ),
                              if (cartController.discount != 0)
                                const SizedBox(
                                  height: 10,
                                ),
                              if (cartController.discount != 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Net Value :    ".tr,
                                      style: titleCopy7.copyWith(fontSize: 15),
                                    ),
                                    Text(cartController.netValue.toString(),
                                        style: title8.copyWith(
                                          fontSize: 15,
                                        ))
                                  ],
                                ),
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: ()=> Get.toNamed(AppRoutes.checkout),
                          height: 56,
                          minWidth: Get.width,
                          color: AppColors.yellow,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          child: Text('Check Out'.tr, style: titleCopy),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        body: GetBuilder(
            init: cartController,
            builder: (context) {
              return SizedBox(
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      pageTitle("My Bag".tr),
                      Flexible(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await cartController.syncCarts();
                          },
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartController.cartProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return cartController.cartProducts[index].product !=
                                      null
                                  ? ProductCartItem(
                                      product: cartController
                                          .cartProducts[index].product!,
                                      qty: cartController.cartProducts[index].qty,
                                      cartController: cartController,
                                      index: index,
                                    )
                                  : SizedBox();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
