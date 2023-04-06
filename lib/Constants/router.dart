import 'package:get/get.dart';
import 'package:timezone/Constants/routes.dart';
import 'package:timezone/PresentationLayer/screens/Private/my_bag.dart';
import 'package:timezone/PresentationLayer/screens/public/product_screen.dart';

import '../BusinessLayer/bindings/home_bindings.dart';
import '../BusinessLayer/bindings/init_bindings.dart';
import '../PresentationLayer/screens/Private/orders_screen.dart';
import '../PresentationLayer/screens/auth/login_screen.dart';
import '../PresentationLayer/screens/auth/signup_screen.dart';
import '../PresentationLayer/screens/public/aboutUs_screen.dart';
import '../PresentationLayer/screens/public/brand_screen.dart';
import '../PresentationLayer/screens/public/category_screen.dart';
import '../PresentationLayer/screens/Private/checkout_screen.dart';
import '../PresentationLayer/screens/public/favorites_screen.dart';
import '../PresentationLayer/screens/public/home_screen.dart';
import '../PresentationLayer/screens/public/notification_screen.dart';
import '../PresentationLayer/screens/Private/profile_screen.dart';
import '../PresentationLayer/screens/public/search_screen.dart';
import '../PresentationLayer/screens/public/splash_screen.dart';

List<GetPage<dynamic>> router = [
  GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.leftToRightWithFade),
  GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginScreen(),
      transition: Transition.zoom,
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
    transition: Transition.fadeIn,
    page: () => Notifications(),
  ),
  GetPage(
    name: AppRoutes.favorites,
    page: () => Favorites(),
  ),
  GetPage(
    name: AppRoutes.profileScreen,
    page: () => Profile(),
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
  GetPage(
    name: AppRoutes.searchScreen,
    transition: Transition.leftToRightWithFade,
    page: () => SearchScreen(),
  ),

  GetPage(
    name: AppRoutes.aboutUs,
    page: () => AboutUs(),
  ),
  GetPage(
    name: AppRoutes.ordersScreen,
    page: () => OrdersScreen(),
      transition: Transition.leftToRightWithFade
  ),
  // GetPage(
  //     name: AppRoutes.orderScreen,
  //     page: () => OrderScreen(),
  //     transition: Transition.zoom),
];
