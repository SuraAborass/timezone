import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/top_categories_controller.dart';

import '../../DataAccessLayer/Models/category.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/ProductsByCategoryRepo.dart';

class ProductsByCategoryController extends GetxController {
  final TopCategoriesController categoriesController = Get.find();
  ProductsByCategoryRepo repo = ProductsByCategoryRepo();
  Product? product;
  List<Product> products = [];
   Category category;
  ProductsByCategoryController(this.category);
  var loading = false.obs;

  @override
  void onInit() async {
    await getProducts();
    super.onInit();
  }

  Future<void> getProducts() async {
    loading.value = true;
    products = await repo.products(category.id);
    update();
    loading.value = false;
  }

}
