import 'package:flutter/material.dart';
import 'package:fruits/core/helpers/extensions.dart';

import '../routing/routes.dart';
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
          style: TextStyles.semiBold16.copyWith(color: AppColor.darkGray),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.registerScreen);
          },
          child: Text(
            'قم بانشاء حساب',
            style: TextStyles.semiBold16.copyWith(color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
