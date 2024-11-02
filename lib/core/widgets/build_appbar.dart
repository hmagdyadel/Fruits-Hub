import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_styles.dart';
import 'notification_widget.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColor.primaryColor,
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: NotificationIcon(),
      ),
    ],
    title: Text(
      title,
      style: TextStyles.bold19,
    ),
  );
}
