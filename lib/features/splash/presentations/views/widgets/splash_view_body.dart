import 'package:flutter/cupertino.dart';
import 'package:fruits/core/helpers/extensions.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/const/strings.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('$assistsPath/plant.svg'),
          ],
        ),
        SvgPicture.asset('$assistsPath/logo.svg'),
        SvgPicture.asset(
          '$assistsPath/splash_bottom.svg',
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 4), () {
      context.pushReplacementNamed(OnBoardingScreen.routeName);
    });
  }
}
