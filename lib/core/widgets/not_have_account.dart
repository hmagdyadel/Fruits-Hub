import 'package:flutter/material.dart';

import '../utils/app_color.dart';
import '../utils/app_text_styles.dart';

class NotHaveAccount extends StatelessWidget {
  const NotHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب؟',
          style: TextStyles.semiBold16.copyWith(color: AppColor.primaryColor),
        ),
        const SizedBox(width: 5),
        Text(
          'قم بانشاء حساب',
          style: TextStyles.semiBold16.copyWith(color: Color(0xFF949D9E)),
        )
      ],
    );
  }
}
