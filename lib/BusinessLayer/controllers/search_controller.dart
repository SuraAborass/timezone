import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/products_controller.dart';
import '../../DataAccessLayer/Models/product.dart';

class SearchController extends GetxController{
  ProductsController productsController = Get.find();
  List<Product> products = [];
  List<Product> searchProducts = [];
  TextEditingController searchText = TextEditingController();

  @override
  void onInit() {
    products = productsController.products;
    super.onInit();
  }
  void search(value) {
      print(" Search Results: " + value);
      searchProducts = products
          .where((e) =>
      e.name.contains(value.toString()) ||
          e.category.contains(value.toString()) ||
          e.brand.contains(value.toString()))
          .toList();
      print("products : " + searchProducts.length.toString());
      update();
  }
}