import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/const/constants.dart';
import 'package:fruits/core/helpers/extensions.dart';
import 'package:fruits/core/utils/app_color.dart';

import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/signin_view.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page?.round() ?? 0;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
              activeColor: AppColor.primaryColor,
              color: currentPage == 1
                  ? AppColor.primaryColor
                  : AppColor.primaryColor.withOpacity(0.5)),
        ),
        const SizedBox(height: 29),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainState: true,
          maintainSize: true,
          maintainAnimation: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: CustomButton(
              onPressed: () {
                Prefs.setBool(isOnBoardingViewSeen, true);
                context.pushReplacementNamed(SigninView.routeName);
              },
              text: 'ابدأ الان',
            ),
          ),
        ),
        const SizedBox(height: 43),
      ],
    );
  }
}
