import 'package:flutter/material.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/notification_widget.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('$imagesPath/profile_image.png'),
      title: Text(
        'صباح الخير!..',
        style: TextStyles.regular16.copyWith(color: AppColor.darkGray),
      ),
      subtitle: Text(
        'Haitham Magdy',
        style: TextStyles.bold16.copyWith(color: AppColor.black),
      ),
      trailing: const NotificationIcon(),
    );
  }
}
