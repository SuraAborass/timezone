import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/PresentationLayer/widgets/Public/loading_item.dart';

import '../../../BusinessLayer/controllers/cart_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/Cart/payment_method_item.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button_navigation.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({Key? key}) : super(key: key);
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: Get.locale!.languageCode == "en"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.black,
          appBar: myAppBar(context),
          drawer: MyDrawer(),
          bottomNavigationBar: const NavBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: GetBuilder(
                  init: cartController,
                  builder: (context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        pageTitle('checkOut'.tr),
                        Expanded(
                          flex: 9,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                TextFormField(
                                  controller: cartController.nameController,
                                  style: mediumNormal,
                                  decoration: InputDecoration(
                                    hintText: "name".tr,
                                    hintStyle: title1,
                                    filled: true,
                                    fillColor: AppColors.lightblack,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.lightgrey),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: AppColors.grey2)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: cartController.emailController,
                                  style: mediumNormal,
                                  decoration: InputDecoration(
                                    hintText: "email".tr,
                                    hintStyle: title1,
                                    filled: true,
                                    fillColor: AppColors.lightblack,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.lightgrey),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: AppColors.grey2)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: cartController.addressController,
                                  style: mediumNormal,
                                  decoration: InputDecoration(
                                    hintText: "adresshint".tr,
                                    hintStyle: title1,
                                    filled: true,
                                    fillColor: AppColors.lightblack,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.lightgrey),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: AppColors.grey2)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: cartController.phoneController,
                                  style: mediumNormal,
                                  decoration: InputDecoration(
                                    hintText: "mobile".tr,
                                    hintStyle: title1,
                                    filled: true,
                                    fillColor: AppColors.lightblack,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.lightgrey),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: AppColors.grey2)),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: cartController.noteController,
                                  style: mediumNormal,
                                  decoration: InputDecoration(
                                    hintText: "notes".tr,
                                    hintStyle: title1,
                                    filled: true,
                                    fillColor: AppColors.lightblack,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 2, color: AppColors.lightgrey),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: AppColors.grey2)),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Method ".tr,
                                      style: bodyNormal.copyWith(fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () => cartController
                                                      .changePaymentType(
                                                          PaymentMethod
                                                              .cashPay),
                                                  child: paymentMethodItem(
                                                      Icon(Icons.money),
                                                      'Cash Payment'.tr,
                                                      cartController
                                                              .paymentMethod
                                                              .value ==
                                                          PaymentMethod
                                                              .cashPay))),
                                          Expanded(
                                              child: InkWell(
                                                  onTap: () => cartController
                                                      .changePaymentType(
                                                          PaymentMethod
                                                              .onlinePay),
                                                  child: paymentMethodItem(
                                                      Image.asset(
                                                        "assets/images/selcom-logo.png",
                                                        width: 70,
                                                      ),
                                                      'Online Payment'.tr,
                                                      cartController
                                                              .paymentMethod
                                                              .value ==
                                                          PaymentMethod
                                                              .onlinePay)))
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (cartController.paymentMethod.value ==
                                        PaymentMethod.onlinePay)
                                      TextFormField(
                                        controller:
                                            cartController.cardNumberController,
                                        style: mediumNormal,
                                        decoration: InputDecoration(
                                          hintText: "Enter card number".tr,
                                          hintStyle: title1,
                                          filled: true,
                                          fillColor: AppColors.lightblack,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: AppColors.lightgrey),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  color: AppColors.grey2)),
                                        ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'total'.tr,
                                            style: mediumBold.copyWith(
                                              color: AppColors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 35),
                                          Text(
                                            cartController.totalValue
                                                .toString(),
                                            style: mediumNormal.copyWith(
                                              color: AppColors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'discount'.tr,
                                            style: mediumBold.copyWith(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          const SizedBox(width: 35),
                                          Text(
                                            cartController.discount.toString(),
                                            style: mediumNormal.copyWith(
                                              color: Colors.redAccent,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'net'.tr,
                                            style: mediumBold,
                                          ),
                                          const SizedBox(width: 30),
                                          Text(
                                            cartController.netValue.toString(),
                                            style: mediumNormal,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Obx(() {
                                  return SizedBox(
                                    height: 50,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        await cartController.submitOrder();
                                      },
                                      height: 56,
                                      minWidth: Get.width,
                                      color: AppColors.yellow,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (cartController.sendingOrder.value)
                                            loadingItem(false),
                                          Text('sendorder'.tr,
                                              style: titleCopy),
                                        ],
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ));
  }
}
