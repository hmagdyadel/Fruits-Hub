import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

import '../const/constants.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 220,
      decoration: ShapeDecoration(
        color: AppColor.veryLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset('$imagesPath/watermelon_test.png'),
                const SizedBox(height: 24),
                ListTile(
                  title: const Text(
                    'بطيخ',
                    style: TextStyles.semiBold16,
                    textAlign: TextAlign.right,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '30 جنيه',
                          style: TextStyles.bold13.copyWith(
                            color: AppColor.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' / ',
                          style: TextStyles.bold13.copyWith(
                            color: AppColor.secondaryColorShade,
                          ),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.semiBold13
                              .copyWith(color: AppColor.secondaryColorShade),
                        )
                      ],
                    ),
                  ),
                  trailing: const CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    child: Icon(
                      Icons.add,
                      color: AppColor.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
