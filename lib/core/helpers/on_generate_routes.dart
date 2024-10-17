import 'package:flutter/material.dart';
import 'package:fruits/features/auth/presentation/views/signin_view.dart';
import 'package:fruits/features/auth/presentation/views/signup_view.dart';

import '../../features/on_boarding/presentation/views/on_boarding_screen.dart';
import '../../features/splash/presentations/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingScreen.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
