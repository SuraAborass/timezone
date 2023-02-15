import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BusinessLayer/controllers/featured_product_controller.dart';
import '../../Constants/colors.dart';
import 'featured_product_item.dart';

class FeaturedProducts extends StatelessWidget {
  FeaturedProducts({Key? key,}) : super(key: key);
final FeaturedProductsController featuredProductsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        GetBuilder(
            init: featuredProductsController,
            builder: (context) {
              return Container(
                height: 150,
                width: deviceSize.width,
                decoration: const BoxDecoration(color: AppColors.black),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: featuredProductsController.featuredProducts.length,
                  itemBuilder: (context, index) {
                    return FeaturedProductItem(featuredProduct: featuredProductsController.featuredProducts[index]);
                  },
                ),
              );
            }
        ),
      ],
    );
  }
}
