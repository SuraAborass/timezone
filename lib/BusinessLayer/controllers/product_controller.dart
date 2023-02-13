import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/top_categories_controller.dart';
import '../../DataAccessLayer/Models/category.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/products_repo.dart';


class ProductController extends GetxController {
  final TopCategoriesController categoriesController = Get.find();
  ProductsRepo repo = ProductsRepo();
  Product? product;
  List<Product> products = [];
 final Category category;
  ProductController(this.category);
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
