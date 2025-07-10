import 'package:flutter/material.dart';


import '../../features/auth/presentation/views/sign_in_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/best_selling_fruits/views/best_selling_views.dart';
import '../../features/home/presentation/views/home_view.dart';
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
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case BestSellingViews.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingViews());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
