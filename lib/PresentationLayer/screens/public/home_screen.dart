import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/TopBrands.dart';
import '../../widgets/TopCategories.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/featured_products.dart';
import '../../widgets/search_field.dart';
import 'button_navigation.dart';

class MyHomePage extends StatelessWidget {
  const  MyHomePage({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: myAppBar(context),
        drawer: MyDrawer(),
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
               const SearchField(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Text("Top Categories".tr, style: title3,),],),),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child:  TopCategories(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Text("Top Brands".tr, style: title3,),],),),
               Padding(
                padding:  const EdgeInsets.all(8.0),
                child:  TopBrands(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Text("Featured Products".tr, style: title3,),],),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  FeaturedProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
