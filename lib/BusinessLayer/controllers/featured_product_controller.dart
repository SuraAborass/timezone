import 'package:get/get.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../../DataAccessLayer/Repositories/featured_repo.dart';


class FeaturedProductsController extends GetxController{
  FeaturedRepo repo = FeaturedRepo();
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