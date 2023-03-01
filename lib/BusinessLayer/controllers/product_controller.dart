import 'package:get/get.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/product_repo.dart';

class ProductController extends GetxController{
  ProductRepo repo = ProductRepo();
  List<Product> products = [];
 final Product product;
  ProductController(this.product);
  var loading = false.obs;

  @override
  void onInit() async {
    await getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    loading.value = true;
   products = await repo.myProduct();
    update();
    loading.value = false;
  }


}