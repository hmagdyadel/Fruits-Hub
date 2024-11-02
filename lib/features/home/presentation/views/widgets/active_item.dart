import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_color.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
            color:const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                  color: const Color(0xFF1B5E37),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: TextStyles.semiBold11.copyWith(color: AppColor.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
