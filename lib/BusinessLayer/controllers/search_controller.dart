import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/products_controller.dart';

import '../../DataAccessLayer/Models/product.dart';

class SearchController extends GetxController {
  ProductsController productsController = Get.find();
  List<Product> products = [];
  List<Product> searchProducts = [];
  TextEditingController searchText = TextEditingController();
  var loading = false.obs;

  @override
  void onInit() {
    products = productsController.products;
    super.onInit();
  }

  void search(value) {
    print(" Search Results: " + value);
    print("product Length : " + products.length.toString());
    searchProducts = products
        .where((element) =>
            element.name
                .toLowerCase()
                .contains(value.toString().toLowerCase()) ||
            element.category
                .toLowerCase()
                .contains(value.toString().toLowerCase()) ||
            element.brand
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
        .toList();
    print("products : " + searchProducts.length.toString());
    update();
  }
}
