import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_styles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'الاكثر مبيعا',
          style: TextStyles.bold16,
        ),
        Text(
          'المزيد',
          style: TextStyles.regular13.copyWith(color: AppColor.darkGray),
        ),
      ],
    );
  }
}
