import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/colors.dart';
import 'package:timezone/Constants/font_styles.dart';
import 'package:timezone/Constants/routes.dart';
import 'package:timezone/DataAccessLayer/Clients/box_client.dart';
import 'package:timezone/DataAccessLayer/Models/cart_product.dart';
import 'package:timezone/DataAccessLayer/Models/product.dart';
import 'package:timezone/DataAccessLayer/Repositories/product_repo.dart';
import 'package:timezone/PresentationLayer/widgets/TZTextForm.dart';

import '../../DataAccessLayer/Clients/order_client.dart';
import '../../PresentationLayer/widgets/snackbars.dart';
import '../../main.dart';

enum PaymentMethod { cashPay, onlinePay }

class CartController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();

  var paymentMethod = PaymentMethod.cashPay.obs;

  ProductRepo productRepo = ProductRepo();
  BoxClient boxClient = BoxClient();
  List<CartProduct> cartProducts = [];
  List<Product> products = [];
  var adding = false.obs;
  var sendingOrder = false.obs;
  TextEditingController newQtyController = TextEditingController();
  num totalValue = 0;
  num discount = 0;
  num netValue = 0;
  OrderClient orderClient = OrderClient();

  @override
  void onInit() async {
    await getCarts();
    await syncCartsOnline();
    if (MyApp.AppUser != null) {
      nameController.value = TextEditingValue(text: MyApp.AppUser!.name);
      emailController.value = TextEditingValue(text: MyApp.AppUser!.email);
    }
    super.onInit();
  }

  Future<void> getCarts() async {
    cartProducts = await boxClient.getCartItems();
    print(cartProducts);
    update();
  }

  Future<void> syncCarts() async {
    if (products.isNotEmpty) {
      cartProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    calc();
    update();
  }

  Future<void> syncCartsOnline() async {
    List<int> ids = cartProducts.map((e) => e.productId).toList();
    products = await productRepo.productsByIds(ids);
    if (products.isNotEmpty) {
      print(products);
      for (var cartItem in cartProducts) {
        cartItem.product =
            products.where((element) => element.id == cartItem.productId).first;
      }
      cartProducts.map((e) => e.product =
          products.where((element) => element.id == e.productId).first);
    }
    calc();
    update();
  }

  Future<void> addToCart(Product product) async {
    var cartProduct = CartProduct(productId: product.id, qty: 1);
    adding.value = true;
    products.add(product);
    cartProduct.product = product;
    cartProducts.add(cartProduct);
    await boxClient.AddToCart(cartProducts);
    adding.value = false;
    await syncCarts();
    update();
    SnackBars.showSuccess("Added Successfully".tr);
  }

  Future<void> removeAll() async {
    await boxClient.removeAllCarts();
    cartProducts.clear();

    calc();
    update();
  }

  void showEditDialog(index, oldValue) {
    newQtyController.value = TextEditingValue(text: oldValue.toString());
    Get.bottomSheet(Container(
      padding: EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.lightblack,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Center(
        child: Column(
          children: [
            Text(
              "Please Enter a New Quantity".tr,
              style: title,
            ),
            Spacer(),
            TZTextForm(
              hint: "Enter a New Quantity".tr,
              obsecure: false,
              controller: newQtyController,
              type: TextInputType.number,
            ),
            Spacer(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    minimumSize: Size(Get.width, 50),
                    backgroundColor: AppColors.yellow,
                    textStyle: title.apply(color: AppColors.black)),
                onPressed: () async {
                  await editCartItemQty(index);
                  Get.back();
                },
                child: Text("Edit".tr))
          ],
        ),
      ),
    ));
  }

  Future<void> editCartItemQty(index) async {
    cartProducts[index].qty = num.parse(newQtyController.value.text);
    calc();
    update();
  }

  Future<void> removeCartItemQty(index) async {
    cartProducts.removeAt(index);
    calc();
    update();
  }

  void changePaymentType(PaymentMethod method) {
    paymentMethod.value = method;
    update();
  }

  void calc() {
    totalValue = 0;
    netValue = 0;
    discount = 0;
    for (var element in cartProducts) {
      totalValue += num.parse(element.product!.price) * element.qty;
      if (num.parse(element.product!.offer) != 0) {
        discount += (num.parse(element.product!.price) -
                num.parse(element.product!.offer)) *
            element.qty;
      }

      netValue = totalValue - discount;
      update();
    }
  }

  Future<void> submitOrder() async {
    sendingOrder.value = true;
    String info = "";
    List<Map<String, dynamic>> cartItems = [];
    print("phoneController " + phoneController.value.toString());
    if (cartProducts.isEmpty) {
      SnackBars.showWarning('You can\'t create an empty order'.tr);
    } else if (nameController.value.text.toString().isEmpty ||
        emailController.value.text.toString().isEmpty ||
        addressController.value.text.toString().isEmpty ||
        phoneController.value.text.toString().isEmpty) {
      SnackBars.showWarning('please fill required fields to continue'.tr);
    } else {
      if (paymentMethod == PaymentMethod.onlinePay &&
          cardNumberController.value.text.isEmpty) {
        SnackBars.showWarning('please fill required fields to continue'.tr);
      } else {
        info = jsonEncode(<String, dynamic>{
          "payment_type": paymentMethod == PaymentMethod.cashPay ? 0 : 1,
          "name": nameController.value.text,
          "email": emailController.value.text,
          "address": addressController.value.text,
          "mobile_number": phoneController.value.text,
          "note": noteController.value.text,
          "customerRef": cardNumberController.value.text
        });
        for (var element in cartProducts) {
          cartItems.add(element.toApiMap());
        }
        boxClient.saveUserMail(emailController.value.text);
      }

      var response = await orderClient.postOrder(jsonDecode(info),
          MyApp.AppUser != null ? MyApp.AppUser!.id : null, cartItems);

      if (response == null) {
        SnackBars.showError(
            'there was an error, please check your internet connection'.tr);
      } else if (response == 'Invalid') {
        SnackBars.showWarning('please check your card number'.tr);
      } else {
        SnackBars.showSuccess('order send successfully'.tr);
        await removeAll();
        Get.toNamed(AppRoutes.ordersScreen);
      }
    }

    sendingOrder.value = false;
  }
}
