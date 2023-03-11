import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:timezone/DataAccessLayer/Models/user.dart';
import 'BusinessLayer/bindings/init_bindings.dart';
import 'Constants/languages.dart';
import 'Constants/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static int currentPage = 0;
  static User? AppUser;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale.fromSubtags(languageCode: "ar"),
      initialBinding: InitBinding(),
      getPages: router,
    );
  }
}
