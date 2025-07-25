import 'package:flutter/material.dart';

import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColor.lightGray, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,

        child: ListTile(
          visualDensity: const VisualDensity(vertical: VisualDensity.minimumDensity) ,
          leading: SvgPicture.asset(image),
          title: Text(
            label,
            style: TextStyles.semiBold15,
          ),

        ),
      ),
    );
  }
}
