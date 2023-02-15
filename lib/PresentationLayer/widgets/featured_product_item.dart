import 'package:flutter/material.dart';
import '../../Constants/font_styles.dart';
import 'package:get/get.dart';
import '../../DataAccessLayer/Models/featured_product.dart';


class FeaturedProductItem extends StatelessWidget {
  const FeaturedProductItem({Key? key,required this.featuredProduct,}) : super(key: key);
  final FeaturedProduct featuredProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){},
              child: Container(
                width: 90,
                decoration:  BoxDecoration(
                  image: DecorationImage(image: NetworkImage(featuredProduct.images[0]),fit: BoxFit.cover),
                  borderRadius:  const BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(featuredProduct.brand,style: title8,),
        ),
      ],
    );
  }
}

