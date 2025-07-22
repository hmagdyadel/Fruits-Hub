import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color:AppColor.lightGray,
            thickness: 1,
          ),
        ),
        const SizedBox(width: 18),
        Text('or'.tr(),style: TextStyles.semiBold16,),
        const SizedBox(width: 18),
        const Expanded(
          child: Divider(
            color:AppColor.lightGray,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
