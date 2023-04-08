import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/cart_controller.dart';
import 'package:timezone/Constants/routes.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/product.dart';

class ProductCartItem extends StatelessWidget {
  ProductCartItem(
      {Key? key,
      required this.product,
      required this.qty,
      required this.cartController,
      required this.index})
      : super(key: key);
  final num qty;
  final Product product;
  final int index;
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            flex: 2,
            child: InkWell(
              onTap: () =>
                  Get.toNamed(AppRoutes.productScreen, arguments: [product]),
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
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                    title: Text(product.brand + "( ${qty.toString()})",
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
          Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                        cartController.showEditDialog(index, qty);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.white,
                        size: 30,
                      )),
                  IconButton(
                      onPressed: () async {
                        await cartController.removeCartItemQty(index);
                      },
                      icon: const Icon(
                        Icons.remove,
                        color: AppColors.white,
                        size: 30,
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
