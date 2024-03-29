import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/cart_controller.dart';
import '../../../BusinessLayer/controllers/favourite_controller.dart';
import '../../../Constants/Helpers/gender.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../../Constants/routes.dart';
import '../../../DataAccessLayer/Models/product.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({Key? key}) : super(key: key);
  final Product product = Get.arguments[0];
  final FavouriteController favouriteController = Get.find();
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: Get.locale!.languageCode == "en"
            ? TextDirection.ltr
            : TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.black,
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder(
                init: cartController,
                builder: (context) {
                  return MaterialButton(
                    onPressed: () async {
                      cartController.addToCart(product);
                    },
                    height: 56,
                    minWidth: Get.width,
                    color: AppColors.yellow,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child:  Text('Add to cart'.tr, style: titleCopy),
                  );
                }),
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                collapsedHeight: 100,
                pinned: true,
                backgroundColor: AppColors.black,
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.myBag);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 30,
                        color: AppColors.white,
                      ))
                ],
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(children: [
                  Hero(
                    tag: product.id.toString() + product.name,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(product.images[0]),
                              fit: BoxFit.contain),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.black45, Colors.transparent],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.black45, Colors.transparent],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)))),
                  GetBuilder(
                      init: favouriteController,
                      builder: (context) {
                        return Positioned(
                            bottom: 15,
                            right: 15,
                            child: IconButton(
                              onPressed: () {
                                favouriteController.toggleFavorite(product);
                              },
                              icon: Icon(
                                favouriteController.checkFavorite(product)
                                    ? Icons.favorite_outline
                                    : Icons.favorite,
                                color: AppColors.yellow,
                                size: 40,
                              ),
                            ));
                      }),
                ])),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(product.brand,
                            style: title.copyWith(
                                color: AppColors.yellow, fontSize: 21)),
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(product.price,
                                  style: num.parse(product.offer) > 0
                                      ? title7.copyWith(fontSize: 16)
                                      : titleCopy7.copyWith(
                                          fontSize: 16,
                                          color: AppColors.white)),
                              if (num.parse(product.offer) > 0)
                                Text(
                                  product.offer,
                                  style: titleCopy8,
                                ),
                            ],
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 2.0, right: 20.0, left: 20.0),
                  child: Text(
                    product.name,
                    style: title8.copyWith(fontSize: 18),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                if (product.brand != "")
                  Container(
                    height: 50,
                    width: Get.width,
                    color: AppColors.lightgrey,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 15,
                          color: AppColors.yellow,
                        ),
                        SizedBox(width:8,),
                        Expanded(
                            child: Row(
                          children: [
                             Text("Brand:".tr,
                                style: title, textAlign: TextAlign.start),
                            SizedBox(width:5,),
                            Text(
                              product.brand,
                              style: title8.copyWith(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 70,
                  width: Get.width,
                  color: AppColors.lightgrey,
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 15,
                        color: AppColors.yellow,
                      ),
                      SizedBox(width:8,),
                      Expanded(
                          child: Row(
                        children: [
                           Text(
                            "Reference N:".tr,
                            style: title,
                          ),
                          SizedBox(width:5,),
                          Text(
                            product.reference_number,
                            style: title8.copyWith(
                            fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: Get.width,
                  color: AppColors.lightgrey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 15,
                        color: AppColors.yellow,
                      ),
                      SizedBox(width:8,),
                      Expanded(
                          child: Row(
                        children: [
                           Text(
                            "Gender:".tr,
                            style: title,
                          ),
                          SizedBox(width:5,),
                          Text(
                            Gender.getGender(product.gender),
                            style: title8.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: Get.width,
                  color: AppColors.lightgrey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 15,
                        color: AppColors.yellow,
                      ),
                      SizedBox(width:8,),
                      Expanded(
                          child: Row(
                        children: [
                           Text(
                            "Movement:".tr,
                            style: title,
                          ),
                          SizedBox(width:5,),
                          Text(
                            product.movement,
                            style: title8.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: Get.width,
                  color: AppColors.lightgrey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 15,
                        color: AppColors.yellow,
                      ),
                      SizedBox(width:8,),
                      Expanded(
                          child: Row(
                        children: [
                           Text(
                            "Case_size:".tr,
                            style: title,
                          ),
                          SizedBox(width:5,),
                          Text(
                            product.case_size,
                            style: title8.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: Get.width,
                  color: AppColors.lightgrey,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 15,
                        color: AppColors.yellow,
                      ),
                      SizedBox(width:8,),
                      Expanded(
                          child: Row(
                        children: [
                           Text(
                            "Case_material:".tr,
                            style: title,
                          ),
                          SizedBox(width:5,),
                          Text(
                            product.case_material,
                            style: title8.copyWith(
                                fontSize: 15, fontWeight: FontWeight.normal),
                          )
                        ],
                      ))
                    ],
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
