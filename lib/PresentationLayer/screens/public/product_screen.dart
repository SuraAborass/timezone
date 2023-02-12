import 'package:flutter/material.dart';
import '../../../Constants/colors.dart';
import '../../../Constants/font_styles.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          onPressed:(){},
          height: 56,
          minWidth: deviceSize.width,
          color: AppColors.yellow ,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(20.0))),
          child: const Text('Add to cart', style: titleCopy ),

        ),
      ),
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
                background: Hero
                  (tag: "product",
                    child: Image.asset('assets/images/Image 6.png',fit: BoxFit.cover,),)
            ), ),
          SliverList(delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
              child: Row(
                children:  [
                  const Expanded(
                    flex: 2,
                    child: Text("Flounce Sleeve V Neck Puff Sleeve Blouse",style: title),),
                  Expanded(
                    flex: 1,
                      child: Column(
                    children: [
                      Text("50.000",style: title7.copyWith(fontSize: 15)),
                      const Text("    40.000 S.P",style: titleCopy8,),
                    ],
                  ))
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
            child: Row(
              children: const [
                Icon(Icons.star, color: AppColors.yellow,),
                Icon(Icons.star, color: AppColors.yellow,),
                Icon(Icons.star, color: AppColors.yellow,),
                Icon(Icons.star, color: AppColors.yellow,),
                Icon(Icons.star, color: AppColors.yellow,),
              ],
            )),
            Padding(padding: const EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.blue,
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.pink,
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppColors.black1,
                    ),
                  ],
                )),
            Padding(padding: const EdgeInsets.only(top: 8.0, right: 20.0, left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(" Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                            style: title.copyWith(fontWeight: FontWeight.normal,fontSize: 16) ,),
                          )
                        ],
                      ),
                    ],
                  ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 50,
              width: deviceSize.width,
              color: AppColors.lightgrey,
              child: Row(
                children: [
                  Container(height: 50,width: 15, color: AppColors.yellow,),
                  Expanded(child: Row(children: [
                    const Text("   Model :  ",style: title,textAlign: TextAlign.start),
                    Text("SKU : vfgxsh1251ed4",style: title8.copyWith(fontSize: 15,),)
                  ],))
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 70,
              width: deviceSize.width,
              color: AppColors.lightgrey,
              child: Row(
                children: [
                  Container(height: 70,width: 15, color: AppColors.yellow,),
                  Expanded(child: Row(children: [
                    const Text("   Composition :  ",style: title,),
                    Expanded(child: Text("60% polyester, 25% polyamide, 15% viscose ",style: title8.copyWith(fontSize: 15,),))
                  ],))
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 50,
              width: deviceSize.width,
              color: AppColors.lightgrey,
              child: Row(
                children: [
                  Container(height: 50,width: 15, color: AppColors.yellow,),
                  Expanded(child: Row(children: [
                    const Text("   Sheer :  ",style: title,),
                    Text("Yes",style: title8.copyWith(fontSize: 15,),)
                  ],))
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: 50,
              width: deviceSize.width,
              color: AppColors.lightgrey,
              child: Row(
                children: [
                  Container(height: 50,width: 15, color: AppColors.yellow,),
                  Expanded(child: Row(children: [
                    const Text("   Fit Type :  ",style: title,),
                    Text("Regular Fit",style: title8.copyWith(fontSize: 15,),)
                  ],))
                ],
              ),
            )
          ]))
        ],
      ),

    );
  }
}
