import 'package:flutter/material.dart';
import '../../../BusinessLayer/controllers/ProductsByBrandId_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/Shimmers/productsByBrandId_shimmer.dart';
import '../../widgets/product_by_Brand_id_item.dart';
import 'button_navigation.dart';
import 'package:get/get.dart';


class ProductsByBrandId extends StatelessWidget {
   ProductsByBrandId({Key? key}) : super(key: key);
  final ProductsByBrandIdController productController = Get.put(ProductsByBrandIdController(Get.arguments[0]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: const NavBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(expandedHeight: 400,
            pinned: true,
            backgroundColor: AppColors.black,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: AppColors.white,
                  ))
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Hero(
                    tag: "brand",
                    child:  Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(productController.brand.image),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
                ],
              ),
            ), ),
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                children:[
                  Text(productController.brand.name,style: title3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:10,left:10,top: 10),
              child: GetBuilder(
                  init: productController,
                  builder: (context) {
                    return SizedBox(
                      height: Get.height - 400,
                      child: productController.loading.value == true
                      ?ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductsByBrandIdItemShimmer();
                        },
                      )
                      :ListView.builder(
                        itemCount: productController.products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductByBrandIdItem(
                              product: productController.products[index]);
                        },
                      ),
                    );
                  }
              ),
            )
          ],),),
        ],
      ),
    );
  }
}
