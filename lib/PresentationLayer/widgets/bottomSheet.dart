import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../BusinessLayer/controllers/profile _controller.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';


class BottomSheet extends StatelessWidget {
   BottomSheet({Key? key}) : super(key: key);
final ProfileController _profileController = Get.find();
  @override
  Widget build (BuildContext context) {
    return Container(
      color: AppColors.black,
      height: 120,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("Profile photo",style: mediumBold ,textAlign: TextAlign.center,),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1,
                  child: ListTile(
                    title: InkWell(onTap: (){
                      _profileController.takePhoto(ImageSource.camera);
                    },
                        child: Icon(Icons.camera_alt_outlined,color: AppColors.grey3,size: 40,)),
                    subtitle: Text("Camera",style: mediumBold,textAlign: TextAlign.center,),
                  )),
              Expanded(flex: 1,
                  child: ListTile(
                    title: InkWell(onTap: (){
                      _profileController.takePhoto(ImageSource.gallery);
                    },
                        child: Icon(Icons.image,color: AppColors.grey3,size: 40,)),
                    subtitle: Text("Gallery",style: mediumBold,textAlign: TextAlign.center,),
                  )),
            ],)
        ],
      ),
    );
  }
}
