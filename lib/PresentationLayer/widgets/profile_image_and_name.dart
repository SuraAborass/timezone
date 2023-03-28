import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/user.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key,required this.user}) : super(key: key);
 final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        title: CircleAvatar(
          backgroundColor: AppColors.yellow,
          radius: 55,
          child: InkWell(
            onTap: (){},
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
              NetworkImage(user.avatar),
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            user.name.tr,
            style: mediumNormal.apply(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
