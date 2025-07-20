import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/helpers/extensions.dart';
import 'package:fruits/core/utils/app_color.dart';

import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/helpers/app_utilities.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/presentation/views/sign_in_view.dart';

class PageViewItem extends StatelessWidget {
  final String imagePath, backgroundColor, subTitle;
  final Widget title;
  final bool isVisible;

  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundColor,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
              if (isVisible)
                Positioned(
                  top: 16,
                  right: 16,
                  child: _SkipButton(),
                ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: AppColor.black),
          ),
        )
      ],
    );
  }
}

class _SkipButton extends StatefulWidget {
  @override
  State<_SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<_SkipButton> {
  bool _isProcessing = false;

  Future<void> _handleSkip() async {
    if (_isProcessing) return;
    setState(() => _isProcessing = true);

    await AppUtilities.instance.setSavedBool(isOnBoardingViewSeen, true);

    if (!mounted) return;
    context.pushReplacementNamed(Routes.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleSkip,
      child: Text(
        'skip'.tr(),
        style: TextStyles.regular13.copyWith(color: AppColor.darkGray),
      ),
    );
  }
}
