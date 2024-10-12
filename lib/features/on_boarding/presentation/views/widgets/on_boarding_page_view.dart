import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

import '../../../../../core/const/constants.dart';
import 'page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  final PageController pageController;

  const OnBoardingPageView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          imagePath: '$imagesPath/page_view_item1_image.svg',
          backgroundColor: '$imagesPath/page_view_item1_background_image.svg',
          subTitle:
              'إكتشف تجربة تسوق فريدة مع Fruit Hub إستكشف مجموعتنا الواسعة',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحباً بك في',
                style: TextStyles.bold23,
              ),
              Text(
                ' HUB',
                style:
                    TextStyles.bold23.copyWith(color: AppColor.secondaryColor),
              ),
              Text(
                'Fruit',
                style: TextStyles.bold23.copyWith(color: AppColor.primaryColor),
              ),
            ],
          ),
          isVisible: (pageController.hasClients
              ? pageController.page!.round() == 0
              : false),
        ),
        PageViewItem(
          imagePath: '$imagesPath/page_view_item2_image.svg',
          backgroundColor: '$imagesPath/page_view_item2_background_image.svg',
          subTitle:
              'إكتشف تجربة تسوق فريدة مع Fruit Hub إستكشف مجموعتنا الواسعة',
          title: const Text(
            'إبحث وتسوق',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
          ),
          isVisible: (pageController.hasClients
              ? pageController.page!.round() == 0
              : false),
        ),
      ],
    );
  }
}
