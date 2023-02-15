import 'package:get/get.dart';
import '../../DataAccessLayer/Models/featured_product.dart';
import '../../DataAccessLayer/Repositories/featured_repo.dart';


class FeaturedProductsController extends GetxController{
  FeaturedRepo repo = FeaturedRepo();
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
    featuredProducts = await repo.myFeaturedProducts();
    update();
    loading.value = false;
  }


}