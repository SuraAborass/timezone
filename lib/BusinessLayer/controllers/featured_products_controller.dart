import 'package:get/get.dart';
import '../../DataAccessLayer/Models/featured_product.dart';
import '../../DataAccessLayer/Repositories/featured_product_repo.dart';

class FeaturedProductController extends GetxController{
  FeaturedProductRepo repo = FeaturedProductRepo();
  List<FeaturedProduct> featuredProducts = [];
  FeaturedProduct? featuredProduct;
  var loading = false.obs;

  @override
  void onInit() async {
    await getFeaturedProducts();
    super.onInit();
  }

  Future<void> getFeaturedProducts() async {
    loading.value = true;
    featuredProducts = await repo.isFeatured();
    update();
    loading.value = false;
  }


}