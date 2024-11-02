import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../const/constants.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const ShapeDecoration(
        shape: OvalBorder(),
        color: Color(0xFFEEF8ED),
      ),
      child: SvgPicture.asset('$imagesPath/notification.svg'),
    );
  }
}
