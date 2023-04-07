import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/font_styles.dart';
import '../../../BusinessLayer/controllers/cart_controller.dart';
import '../../../BusinessLayer/controllers/search_controller.dart';
import '../../../Constants/colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/product_item.dart';
import '../../widgets/button_navigation.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController searchController = Get.put(SearchController());
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: const NavBar(),
        backgroundColor: AppColors.black,
        drawer: MyDrawer(),
        appBar: myAppBar(context),
        body: GetBuilder(
            init: searchController,
            builder: (_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autofocus: true,
                      autocorrect: true,
                      style: title1.apply(color: AppColors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                      ),
                      controller: searchController.searchText,
                      onChanged: (value) {
                        searchController.search(value);
                      },
                    ),
                  ),
                  if (searchController.searchProducts.length > 0)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: pageTitle("Search Result"),
                    ),
                  const SizedBox(height: 10,),
                        Flexible(
                              child: searchController.searchProducts.isNotEmpty
                                  ?SizedBox(
                                       width: double.infinity,
                                       height: Get.height - 310,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: searchController.searchProducts.length,
                                             itemBuilder: (_, int index) {
                                              return ProductItem(
                                                        product:
                                                               searchController.searchProducts[index],
                                                        cartController: cartController,);
                              }),
                        )
                                  : Center(
                                      child: Text(
                                         'No Results'.tr,
                                          style: titleBold.copyWith(fontSize: 16),
                                ),
                              )
                    )
                ],
              );
            }),
      ),
    );
  }
}
