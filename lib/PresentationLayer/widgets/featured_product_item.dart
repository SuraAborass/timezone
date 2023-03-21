import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/colors.dart';
import 'package:timezone/Constants/routes.dart';

import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/product.dart';

class FeaturedProductItem extends StatelessWidget {
  const FeaturedProductItem({
    Key? key,
    required this.featuredProduct,
  }) : super(key: key);
  final Product featuredProduct;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.productScreen,
                    arguments: [featuredProduct]);
              },
              child: Hero(
                tag: featuredProduct.id.toString() + featuredProduct.name,
                child: Container(
                  width: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(featuredProduct.images[0]),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(featuredProduct.brand, style: title5),
                  const SizedBox(
                    width: 30,
                    height: 1,
                  ),
                  Text(
                    featuredProduct.price,
                    style: title8,
                  ),
                ],
              ),
              Text(
                featuredProduct.name,
                style: title8.copyWith(color: AppColors.yellow),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
