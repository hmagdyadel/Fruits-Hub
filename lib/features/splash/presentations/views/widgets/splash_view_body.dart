import 'package:flutter/cupertino.dart';
import 'package:fruits/core/helpers/extensions.dart';
import 'package:fruits/core/routing/routes.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/helpers/app_utilities.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateAfterSplash();
    });
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

  Future<void> navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    final isOnBoardingSeen = await AppUtilities.instance.getSavedBool(isOnBoardingViewSeen);

    if (isOnBoardingSeen) {
      final isLoggedIn = FirebaseAuthService().isUserLoggedIn();
      if (mounted) {
        context.pushReplacementNamed(isLoggedIn ? Routes.registerScreen : Routes.loginScreen);
      }
    } else {
      if (mounted) {
        context.pushReplacementNamed(Routes.onBoarding);
      }
    }
  }
}
