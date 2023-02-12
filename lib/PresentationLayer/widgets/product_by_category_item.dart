import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../BusinessLayer/controllers/product_controller.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/product.dart';
import '../screens/public/product_screen.dart';

class ProductByCategoryItem extends StatelessWidget {
  ProductByCategoryItem({Key? key,required this.product}) : super(key: key);
  final Product product;
  final ProductController productController = Get.find();
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
          margin: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: AppColors.lightblack,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            height: 100,
            width: deviceSize.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: ()=> Get.to(const ProductScreen()),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(product.images[0]),
                              fit: BoxFit.cover),
                          color: AppColors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10.0))),
                      height: 90,
                      width: 90 ,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ListTile(
                    title:  Text(product.description,style: title5,textAlign: TextAlign.start),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(product.price,style: title7),
                        Text(product.offer,style: title8),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.white,
                            ),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.blue,
                          ),
                          Padding(
                            padding: EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.pink,
                            ),
                          ),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: AppColors.black1,
                          ),],),))],),
        );
  }
}
