import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../Constants/routes.dart';
import '../../DataAccessLayer/Models/product.dart';
import 'package:get/get.dart';


class SearchResult extends StatelessWidget {
  const SearchResult({Key? key,required this.product}) : super(key: key);
 final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            color: AppColors.lightblack,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        height: 100,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () => Get.toNamed(AppRoutes.productScreen,arguments: [product]),
                child: Hero(
                  tag: product.id.toString() + product.name,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.images[0]),
                            fit: BoxFit.contain),
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
                      title: Text(product.brand,
                          style: title5, textAlign: TextAlign.start),
                      subtitle: Text(
                        product.name,
                        style: title5.copyWith(fontSize: 10),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 1,
                      ),
                      Text(product.price,
                          style: num.parse(product.offer) > 0
                              ? title7.apply(
                              decoration: TextDecoration.lineThrough)
                              : titleCopy7),
                      const SizedBox(
                        width: 30,
                        height: 1,
                      ),
                      if (num.parse(product.offer) > 0)
                        Text(product.offer, style: title8),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
