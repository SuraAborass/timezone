import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/controllers/featured_product_controller.dart';
import '../../../Constants/colors.dart';
import '../../widgets/Shimmers/featured_products_shimmer.dart';
import '../../widgets/Shimmers/productsByBrandId_shimmer.dart';
import '../../widgets/Shimmers/productsByCategoryId_shimmer.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/featuredProdudctItemFromDrawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/product_by_Brand_id_item.dart';
import '../../widgets/product_by_category_item.dart';
import 'button_navigation.dart';

class FeaturedProducts extends StatelessWidget {
   FeaturedProducts({Key? key,}) : super(key: key);
final FeaturedProductsController featuredProductsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: Get.locale!.languageCode == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
            backgroundColor: AppColors.black,
            drawer: MyDrawer(),
            appBar: myAppBar(context),
            bottomNavigationBar: const NavBar(),
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: pageTitle("Featured Products"),
                  ),
                  GetBuilder(
                      init: featuredProductsController,
                      builder: (context) {
                        return featuredProductsController.loading.value == true
                            ?SizedBox(
                          height: Get.height-250,
                              child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) {
                              return ProductsByBrandIdItemShimmer();
                          },
                        ),
                            )
                            :SizedBox(
                          height: Get.height-250,
                              child: ListView.builder(
                          itemCount: featuredProductsController.featuredProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                              return featuredProductItem(
                                  featuredProduct: featuredProductsController.featuredProducts[index]);
                          }
                        ),
                            );
                      }),
                ],
              ),
            )));
  }
}
