import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/Constants/routes.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/product.dart';

class featuredProductItem extends StatelessWidget {
  const featuredProductItem({Key? key, required this.featuredProduct})
      : super(key: key);
  final Product featuredProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: AppColors.lightblack,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 100,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () => Get.toNamed(AppRoutes.productScreen,
                  arguments: [featuredProduct]),
              child: Hero(
                tag: "product",
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(featuredProduct.images[0]),
                          fit: BoxFit.cover),
                      color: AppColors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  height: 90,
                  width: 90,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                    title: Text(featuredProduct.brand,
                        style: title5, textAlign: TextAlign.start),
                    subtitle: Text(
                      featuredProduct.name,
                      style: title5.copyWith(fontSize: 10),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 1,
                    ),
                    Text(featuredProduct.price,
                        style: num.parse(featuredProduct.offer) > 0
                            ? title7.apply(
                                decoration: TextDecoration.lineThrough)
                            : titleCopy7),
                    const SizedBox(
                      width: 30,
                      height: 1,
                    ),
                    if (num.parse(featuredProduct.offer) > 0)
                      Text(featuredProduct.offer, style: title8),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: const [
                SizedBox(
                  height: 60,
                ),
                Icon(
                  Icons.add_shopping_cart,
                  color: AppColors.white,
                  size: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
