import 'package:flutter/material.dart';
import 'package:fruits/core/helpers/extensions.dart';

import 'package:svg_flutter/svg_flutter.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../auth/presentation/views/login_view.dart';

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
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(isOnBoardingViewSeen, true);
                    context.pushReplacementNamed(LoginView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13
                          .copyWith(color: const Color(0xFF949D9E)),
                    ),
                  ),
                ),
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
            style:
                TextStyles.semiBold13.copyWith(color: const Color(0xFF4E5456)),
          ),
        )
      ],
    );
  }
}
