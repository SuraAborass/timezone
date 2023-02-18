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
                      image: DecorationImage(image: AssetImage('assets/images/Mask Group 1.png'),fit: BoxFit.cover),
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 90,
                  width: 90 ,
                ),
              ),
            ),
             Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CASIO ",style: title5.copyWith(fontSize: 18),textAlign: TextAlign.start),
                  ListTile(
                    title:  Text("asaccfvfb ",style: title5.copyWith(fontWeight: FontWeight.normal),textAlign: TextAlign.start),
                    subtitle: ListTile(title:  RichText(text: TextSpan(children:[
                        const TextSpan(text: "Qty:  " ,style: titleCopy7),
                        TextSpan(text: "5" ,style: titleCopy7.copyWith(color: AppColors.white)),
                      const TextSpan(text: "   price: " ,style: titleCopy7),
                      TextSpan(text: "40" ,style: titleCopy7.copyWith(color: AppColors.white)),])),
                    )),
                  RichText(text: TextSpan(children:[
                    const TextSpan(text: "Total:  " ,style: titleCopy7),
                    TextSpan(text: "200.000" ,style: titleCopy7.copyWith(color: AppColors.white)),])),
                ],
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
