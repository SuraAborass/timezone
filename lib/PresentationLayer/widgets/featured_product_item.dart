import 'package:flutter/material.dart';
import 'package:timezone/Constants/colors.dart';
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
                width: 120,
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
          child: Column(
            children: [
              // RichText(text: TextSpan(children:[
              //   TextSpan(text: featuredProduct.brand ,style: title5.copyWith(fontSize: 12),),
              //
              //   TextSpan(text: featuredProduct.price ,style: title8),
              // ])),
              // Text(featuredProduct.name,style: title8.copyWith(color: AppColors.yellow),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(featuredProduct.brand,style: title5),
                  const SizedBox(width: 30,height: 1,),
                  Text(
                    featuredProduct.price,style: title8,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(featuredProduct.name,style: title8.copyWith(color: AppColors.yellow),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

