import 'package:get/get.dart';
import 'package:timezone/DataAccessLayer/Repositories/product_repo.dart';
import '../../DataAccessLayer/Models/product.dart';



class FeaturedProductsController extends GetxController{
  ProductRepo repo = ProductRepo();
  List<Product> featuredProducts = [];
  Product? featuredProduct;
  var loading = false.obs;

  @override
  void onInit() async {
    await getFeaturedProducts();
    super.onInit();
  }

  Future<void> getFeaturedProducts() async {
    loading.value = true;
    featuredProducts = await repo.myFeaturedProducts();
    update();
    loading.value = false;
  }


}