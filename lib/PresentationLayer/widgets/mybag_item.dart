import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';


class MyBagItem extends StatelessWidget {
  const MyBagItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize=MediaQuery.of(context).size;

    return Container(
        decoration: const BoxDecoration(color: AppColors.lightblack,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        height: 120,
        width: deviceSize.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: (){},
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: const  BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/Image 6.png'),fit: BoxFit.cover),
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 90,
                  width: 90 ,
                ),
              ),
            ),
            const Expanded(
              flex: 3,
              child: ListTile(
                title:  Text("Flounce Sleeve V Neck Puff Sleeve Blouse",style: title5,textAlign: TextAlign.start),
                subtitle: Text("Qty: 5   Price: 40.000   Total: 20000",style: titleCopy7),
              ),
            ),
            Expanded(
                flex:1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.edit_calendar_outlined,color: AppColors.grey4,),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.remove_circle,color: AppColors.grey4,),
                      )
                    ],
                  ),
                ))
          ],
        ),
    );
  }
}
