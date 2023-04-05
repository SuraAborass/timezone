import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/colors.dart';
import '../../../BusinessLayer/controllers/top_categories_controller.dart';
import '../../widgets/Shimmers/category_shimmer.dart';
import '../../widgets/appbar.dart';
import '../../widgets/categoryItemFromDrawer.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/button_navigation.dart';


class TopCategories extends StatelessWidget {
   TopCategories({Key? key}) : super(key: key);
final TopCategoriesController topCategoriesController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(topCategoriesController.categories);
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
                    child: pageTitle("Top Categories"),
                  ),
                  GetBuilder(
                      init: topCategoriesController,
                      builder: (context) {
                        return topCategoriesController.loading.value == true
                            ?SizedBox(
                          height: Get.height - 250,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryShimmerItem();
                            },
                          ),
                        )
                          :SizedBox(
                          height: Get.height - 250,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: topCategoriesController.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CategoryItem(
                                  category: topCategoriesController.categories[index]);
                            },
                          ),
                        );
                      }),
                ],
              ),
            )));
  }
}
