import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

import '../../../../../core/widgets/custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const TermsAndConditions({super.key, required this.onChanged});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChanged: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'من خلال إنشاء حساب، فإنك توافق علي ',
              style: TextStyles.semiBold13.copyWith(color: AppColor.darkGray),
              children: [
                TextSpan(
                  text: 'الشروط والاحكام الخاصة بنا',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColor.lightPrimaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle terms and conditions tap event here
                    },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
