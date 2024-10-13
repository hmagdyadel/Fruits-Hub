import 'package:flutter/material.dart';
import 'package:fruits/core/helpers/extensions.dart';

import '../utils/app_color.dart';
import '../utils/app_text_styles.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل؟',
          style: TextStyles.semiBold16.copyWith(color: AppColor.darkGray),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            'تسجيل الدخول',
            style: TextStyles.semiBold16.copyWith(color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
