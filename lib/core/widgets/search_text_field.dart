import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../const/constants.dart';
import '../utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            suffixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset('$imagesPath/filter.svg'),
              ),
            ),
            prefixIcon: SizedBox(
              width: 20,
              child: Center(
                child: SvgPicture.asset('$imagesPath/search_icon.svg'),
              ),
            ),
            hintText: 'ابحث عن ',
            hintStyle: TextStyles.regular13.copyWith(color: AppColor.darkGray),
            filled: true,
            fillColor: AppColor.white,
            border: buildOutlineInputBorder(),
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder()),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: AppColor.white,
      ),
    );
  }
}
