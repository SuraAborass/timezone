import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/cart_controller.dart';
import 'package:timezone/Constants/font_styles.dart';
import '../../../BusinessLayer/controllers/ProductsByCategoryController.dart';
import '../../../Constants/colors.dart';
import '../../widgets/Shimmers/products_shimmer.dart';
import '../../widgets/product_item.dart';
import 'button_navigation.dart';

class ProductsByCategoryId extends StatelessWidget {
  ProductsByCategoryId({
    Key? key,
  }) : super(key: key);
  final ProductsByCategoryController productController =
      Get.put(ProductsByCategoryController(Get.arguments[0]));
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.black,
        bottomNavigationBar: const NavBar(),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              expandedHeight: 300,
              /* pinned: true, */
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
                      tag: productController.category.id.toString() +
                          productController.category.name,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    productController.category.image),
                                fit: BoxFit.cover),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: Get.width,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 50,
                        width: Get.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black, Colors.transparent])),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        child: Center(
                          child: Text(
                            productController.category.name,
                            style: title.apply(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            GetBuilder(
                init: productController,
                builder: (_) {
                  return productController.loading.value == true
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                          childCount: 5,
                          (context, index) {
                            return ProductsShimmer();
                          },
                        ))
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                          childCount: productController.products.length,
                          (context, index) {
                            return ProductItem(
                                product: productController.products[index],cartController: cartController,);
                          },
                        ));
                })
          ],
        ),
      ),
    );
  }
}
