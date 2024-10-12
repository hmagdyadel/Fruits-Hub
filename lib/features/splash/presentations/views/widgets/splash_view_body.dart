import 'package:flutter/cupertino.dart';
import 'package:fruits/core/helpers/extensions.dart';
import 'package:fruits/features/auth/presentation/views/login_view.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/services/shared_preferences_singleton.dart';
import '../../../../on_boarding/presentation/views/on_boarding_screen.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset('$imagesPath/plant.svg'),
          ],
        ),
        SvgPicture.asset('$imagesPath/logo.svg'),
        SvgPicture.asset(
          '$imagesPath/splash_bottom.svg',
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    bool isOnBoardingSeen = Prefs.getBool(isOnBoardingViewSeen);

    Future.delayed(const Duration(seconds: 3), () {
      if (isOnBoardingSeen) {
        context.pushReplacementNamed(LoginView.routeName);
      } else {
        context.pushReplacementNamed(OnBoardingScreen.routeName);
      }
    });
  }
}
