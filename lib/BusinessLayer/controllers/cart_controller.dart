import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/colors.dart';
import 'package:timezone/Constants/font_styles.dart';
import 'package:timezone/DataAccessLayer/Clients/box_client.dart';
import 'package:timezone/DataAccessLayer/Models/cart_product.dart';
import 'package:timezone/DataAccessLayer/Models/product.dart';
import 'package:timezone/DataAccessLayer/Repositories/product_repo.dart';
import 'package:timezone/PresentationLayer/widgets/TZTextForm.dart';

import '../../PresentationLayer/widgets/snackbars.dart';

class CartController extends GetxController {
  ProductRepo productRepo = ProductRepo();
  BoxClient boxClient = BoxClient();
  List<CartProduct> cartProducts = [];
  List<Product> products = [];

  var adding = false.obs;

  TextEditingController newQtyController = TextEditingController();

  num totalValue = 0;
  num discount = 0;
  num netValue = 0;
  @override
  void onInit() async {
    await getCarts();
    await syncCartsOnline();

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
      for (var cartitem in cartProducts) {
        cartitem.product =
            products.where((element) => element.id == cartitem.productId).first;
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
    SnackBars.showSuccess("Added Successfully");
  }

  void showEditDialog(index, oldvalue) {
    newQtyController.value = TextEditingValue(text: oldvalue.toString());
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
              "Please Enter a New Quantity :",
              style: title,
            ),
            Spacer(),
            TZTextForm(
              hint: "Enter a New Quantity",
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
                child: Text("Edit"))
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
}
