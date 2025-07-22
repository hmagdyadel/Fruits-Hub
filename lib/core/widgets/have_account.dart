import 'package:easy_localization/easy_localization.dart';
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
          'already_have_an_account'.tr(),
          style: TextStyles.semiBold16.copyWith(color: AppColor.darkGray),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Text(
            'login'.tr(),
            style: TextStyles.semiBold16.copyWith(color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
