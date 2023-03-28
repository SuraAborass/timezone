import 'package:get/get.dart';

import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/product_repo.dart';

class ProductsController extends GetxController {
  late List<Product> products = [];
  var productRepo = ProductRepo();
  var loading = false.obs;

  @override
  void onInit() async {
    await getSearchProducts();
    super.onInit();
  }

  Future<void> getSearchProducts() async {
    loading.value = true;
    products = await productRepo.getProducts();
    update();
    loading.value = false;
  }
}
