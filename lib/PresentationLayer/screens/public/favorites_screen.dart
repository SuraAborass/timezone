import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../BusinessLayer/controllers/favourite_controller.dart';
import '../../../Constants/colors.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button_navigation.dart';
import '../../widgets/drawer.dart';
import '../../widgets/favorite_item.dart';
import '../../widgets/page_title.dart';

class Favorites extends StatelessWidget {
  Favorites({Key? key}) : super(key: key);
  final FavouriteController favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Get.locale!.languageCode == "en"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: myAppBar(context),
        drawer: MyDrawer(),
        bottomNavigationBar: const NavBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: pageTitle("Favorites".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: GetBuilder(
                            init: favouriteController,
                            builder: (context) {
                              return SizedBox(
                                height: Get.height - 300,
                                child: ListView.builder(
                                  itemCount: favouriteController
                                      .favoritesProducts.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return FavoriteItem(
                                      favourite: favouriteController
                                          .favoritesProducts[index],
                                      favouriteController: favouriteController,
                                    );
                                  },
                                ),
                              );
                            }),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
