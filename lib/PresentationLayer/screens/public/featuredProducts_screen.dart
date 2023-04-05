import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/controllers/featured_products_controller.dart';
import '../../../Constants/colors.dart';
import '../../widgets/Shimmers/products_shimmer.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/featuredProdudctItemFromDrawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/button_navigation.dart';

class FeaturedProducts extends StatelessWidget {
  FeaturedProducts({
    Key? key,
  }) : super(key: key);
  final FeaturedProductsController productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: Get.locale!.languageCode == "en"
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
                      init: productsController,
                      builder: (context) {
                        return productsController.loading.value == true
                            ? SizedBox(
                                height: Get.height - 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: 8,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ProductsShimmer();
                                  },
                                ),
                              )
                            : SizedBox(
                                height: Get.height - 250,
                                child: ListView.builder(
                                    itemCount: productsController
                                        .featuredProducts.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return featuredProductItem(
                                          featuredProduct:
                                              productsController
                                                  .featuredProducts[index]);
                                    }),
                              );
                      }),
                ],
              ),
            )));
  }
}
