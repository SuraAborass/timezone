import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/BusinessLayer/controllers/favourite_controller.dart';
import 'package:timezone/Constants/routes.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/favourite.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {Key? key, required this.favourite, required this.favouriteController})
      : super(key: key);
  final Favourite favourite;
  final FavouriteController favouriteController;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: AppColors.lightblack,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      height: 100,
      width: deviceSize.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.productScreen);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(favourite.product!.images[0]),
                        fit: BoxFit.cover),
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
                    title: Text(favourite.product!.brand,
                        style: title5, textAlign: TextAlign.start),
                    subtitle: Text(
                      favourite.product!.name,
                      style: title5.copyWith(fontSize: 10),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 1,
                    ),
                    Text(favourite.product!.price, style: title7),
                    const SizedBox(
                      width: 30,
                      height: 1,
                    ),
                    Text(favourite.product!.offer, style: title8),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.remove_circle),
              color: AppColors.white,
              onPressed: () {
                if (favourite.product != null) {
                  favouriteController.toggleFavorite(favourite.product);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
