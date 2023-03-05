import 'package:get/get.dart';
import '../controllers/favourite_controller.dart';
import '../controllers/featured_product_controller.dart';
import '../controllers/notification_controller.dart';
import '../controllers/product_controller.dart';
import '../controllers/top_brands_controller.dart';
import '../controllers/top_categories_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BackNotificationController>(BackNotificationController());
    Get.put<TopCategoriesController>(TopCategoriesController());
    Get.put<TopBrandsController>(TopBrandsController());
    Get.put<FeaturedProductsController>(FeaturedProductsController());
    Get.put<FavouriteController>(FavouriteController());
  }
}
