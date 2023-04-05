import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../BusinessLayer/controllers/top_brands_controller.dart';
import '../../../Constants/colors.dart';
import '../../widgets/Shimmers/brandDrawer_shimmer.dart';
import '../../widgets/appbar.dart';
import '../../widgets/brandItemFromDrawer.dart';
import '../../widgets/drawer.dart';
import '../../widgets/page_title.dart';
import '../../widgets/button_navigation.dart';


class BrandScreen extends StatelessWidget {
   BrandScreen({Key? key}) : super(key: key);
final TopBrandsController topBrandsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Directionality(
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
                    child: pageTitle("Top Brands"),
                  ),
                  GetBuilder(
                      init: topBrandsController,
                      builder: (context) {
                        return topBrandsController.loading.value == true
                            ?SizedBox(
                          height: Get.height - 250,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return BrandShimmer();
                            },
                          ),
                        )
                          :SizedBox(
                          height: Get.height - 250,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,),
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: topBrandsController.topBrands.length,
                            itemBuilder: (BuildContext context, int index) {
                              return BrandItem(
                                  brand: topBrandsController.topBrands[index]);
                            },
                          ),
                        );
                      }),
                ],
              ),
            )));
  }
}
