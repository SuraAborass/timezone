import 'package:flutter/material.dart';

import '../../Constants/colors.dart';
import '../../Constants/font_styles.dart';
import '../../DataAccessLayer/Models/notification.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);
  final UserNotification notification;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: deviceSize.width,
        height: 79,
        decoration: const BoxDecoration(
          color: AppColors.lightgrey,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 66,
                height: 64,
                decoration: const BoxDecoration(
                  color: AppColors.lightblack,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/notification-icon-png-9.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          notification.title,
                          style: title6.copyWith(
                              fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                        Text(notification.subtitle,
                            style: title6.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 14)),
                        Text(notification.time, style: titleCopy7),
                      ]),
                )),
          ],
        ));
  }
}
