import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/cart_controller.dart';

import '../../../BusinessLayer/controllers/favourite_controller.dart';
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
                  child: const Text('Add to cart', style: titleCopy),
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
                  height: 100,
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
                        height: 100,
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
                                        fontSize: 16, color: AppColors.white)),
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
              /* Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: AppColors.yellow,
                      ),
                      Spacer(),
                    ],
                  )), */
              /* Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 20.0, right: 20.0, left: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            " Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                            style: title.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ), */
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
                      Expanded(
                          child: Row(
                        children: [
                          const Text("   Brand :  ",
                              style: title, textAlign: TextAlign.start),
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
                    Expanded(
                        child: Row(
                      children: [
                        const Text(
                          "   Reference N :  ",
                          style: title,
                        ),
                        Expanded(
                            child: Text(
                          product.name,
                          style: title8.copyWith(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ))
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
                    Expanded(
                        child: Row(
                      children: [
                        const Text(
                          "   Gender :  ",
                          style: title,
                        ),
                        Text(
                          "Women",
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
                    Expanded(
                        child: Row(
                      children: [
                        const Text(
                          "   Movement :  ",
                          style: title,
                        ),
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
                    Expanded(
                        child: Row(
                      children: [
                        const Text(
                          "   Case-size :  ",
                          style: title,
                        ),
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
                    Expanded(
                        child: Row(
                      children: [
                        const Text(
                          "   Case-material :  ",
                          style: title,
                        ),
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
    );
  }
}
