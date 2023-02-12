import 'package:flutter/material.dart';
import '../../../BusinessLayer/controllers/product_controller.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';
import '../../widgets/product_by_category_item.dart';
import 'package:get/get.dart';
import 'button_navigation.dart';

class OneCollection extends StatelessWidget {
 OneCollection({Key? key,}) : super(key: key);
   final ProductController productController = Get.put(ProductController(Get.arguments[0]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      bottomNavigationBar: const NavBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(expandedHeight: 400,
            pinned: true,
            backgroundColor: AppColors.black,
           actions: [
             IconButton(
                 onPressed: () {},
                 icon: const Icon(
                   Icons.shopping_cart,
                   size: 30,
                   color: AppColors.white,
                 ))
           ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Hero(
                    tag: "category",
                    child:  Container(
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(productController.category.image),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                    ),
                  ),
                ],
              ),
            ), ),
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                children:[
                  Text(productController.category.name,style: title3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right:10,left:10,top: 10),
              child: GetBuilder(
                init: productController,
                builder: (context) {
                  return SizedBox(
                    height: Get.height - 400,
                    child: ListView.builder(
                      itemCount: productController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductByCategoryItem(
                            product: productController.products[index]);
                      },
                    ),
                  );
                }
              ),
            )
          ],),),
        ],
      ),
    );
  }
}
