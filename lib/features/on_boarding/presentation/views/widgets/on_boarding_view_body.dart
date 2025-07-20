import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/const/constants.dart';
import 'package:fruits/core/helpers/extensions.dart';
import 'package:fruits/core/utils/app_color.dart';

import '../../../../../core/helpers/app_utilities.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/sign_in_view.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  final int totalPages = 2;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      final page = pageController.page?.round() ?? 0;
      if (page != currentPage) {
        setState(() {
          currentPage = page;
        });
      }
    });
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
        buildDotsIndicator(),
        const SizedBox(height: 29),
        onBoardingButton(),
        const SizedBox(height: 43),
      ],
    );
  }

  Widget buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: totalPages,
      decorator: DotsDecorator(
        activeColor: AppColor.primaryColor,
        color: currentPage == 1 ? AppColor.primaryColor : AppColor.primaryColor.withAlpha(127),
      ),
    );
  }

  Widget onBoardingButton() {
    return Visibility(
      visible: currentPage == totalPages - 1,
      maintainState: true,
      maintainSize: true,
      maintainAnimation: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: CustomButton(
          onPressed: () async {
            await AppUtilities.instance.setSavedBool(isOnBoardingViewSeen, true);
            if (!mounted) return;
            context.pushReplacementNamed(Routes.loginScreen);
          },
          text: 'start_now'.tr(),
        ),
      ),
    );
  }

}
