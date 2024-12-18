import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../const/constants.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomCheckBox(
      {super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          color: isChecked ? AppColor.primaryColor : AppColor.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isChecked ? Colors.transparent : AppColor.lightGray,
                width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: isChecked
              ? SvgPicture.asset('$imagesPath/Check.svg')
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
