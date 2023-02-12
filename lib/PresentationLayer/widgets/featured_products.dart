import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BusinessLayer/controllers/featured_products_controller.dart';
import '../../Constants/colors.dart';
import 'featured_product_item.dart';


class FeaturedProducts extends StatelessWidget {
  FeaturedProducts({Key? key,}) : super(key: key);
  final FeaturedProductController featuredProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        GetBuilder(
            init: featuredProductController,
            builder: (context) {
              return Container(
                height: 250,
                width: deviceSize.width,
                decoration: const BoxDecoration(color: AppColors.black),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  itemCount: featuredProductController.featuredProducts.length,
                  itemBuilder: (context, index) {
                    return FeaturedProductItem(featuredProduct: featuredProductController.featuredProducts[index],);
                  },
                ),
              );
            }
        ),
      ],
    );
  }
}
