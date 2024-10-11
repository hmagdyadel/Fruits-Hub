import 'package:flutter/material.dart';

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
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحباً بك في'),
              Text('Fruit'),
              Text('HUB'),
            ],
          ),
          isVisible: (pageController.hasClients? pageController.page!.round() == 0 : false),
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
          isVisible: (pageController.hasClients? pageController.page!.round() == 0 : false),
        ),
      ],
    );
  }
}
