import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/cart_controller.dart';

import '../controllers/favourite_controller.dart';
import '../controllers/products_controller.dart';
import '../controllers/notification_controller.dart';
import '../controllers/top_brands_controller.dart';
import '../controllers/top_categories_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BackNotificationController>(BackNotificationController());
    Get.put<TopCategoriesController>(TopCategoriesController());
    Get.put<TopBrandsController>(TopBrandsController());
    Get.put<ProductsController>(ProductsController());
    Get.put<FavouriteController>(FavouriteController());
    Get.put<CartController>(CartController());
  }
}
