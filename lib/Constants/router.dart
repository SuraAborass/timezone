import 'package:get/get.dart';
import 'package:timezone/Constants/routes.dart';
import 'package:timezone/PresentationLayer/screens/public/my_bag.dart';
import 'package:timezone/PresentationLayer/screens/public/product_screen.dart';

import '../BusinessLayer/bindings/home_bindings.dart';
import '../BusinessLayer/bindings/init_bindings.dart';
import '../PresentationLayer/screens/auth/login_screen.dart';
import '../PresentationLayer/screens/auth/signup_screen.dart';
import '../PresentationLayer/screens/public/brand_screen.dart';
import '../PresentationLayer/screens/public/category_screen.dart';
import '../PresentationLayer/screens/public/checkout_screen.dart';
import '../PresentationLayer/screens/public/home_screen.dart';
import '../PresentationLayer/screens/public/notification_screen.dart';
import '../PresentationLayer/screens/public/splash_screen.dart';

List<GetPage<dynamic>> router = [
  GetPage(
    name: AppRoutes.splashScreen,
    page: () => SplashScreen(),
  ),
  GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginScreen(),
      binding: InitBinding()),
  GetPage(
      name: AppRoutes.register,
      page: () => Register(),
      binding: InitBinding()),
  GetPage(
      name: AppRoutes.homepage,
      page: () => const MyHomePage(),
      binding: HomeBinding()),
  GetPage(
    name: AppRoutes.notifications,
    page: () => Notifications(),
  ),
  GetPage(
    name: AppRoutes.category,
    page: () => ProductsByCategoryId(),
  ),
  GetPage(
    name: AppRoutes.brand,
    page: () => ProductsByBrandId(),
  ),
  GetPage(
    name: AppRoutes.myBag,
    page: () => MyBag(),
  ),
GetPage(
    name: AppRoutes.productScreen,
    page: () => ProductScreen(),
  ),
  GetPage(
    name: AppRoutes.checkout,
    page: () => CheckOutScreen(),
  ),

];
