import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/routing/routes.dart';
import 'package:fruits/features/best_selling_fruits/views/best_selling_views.dart';

import '../../features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_screen.dart';
import '../../features/splash/presentations/views/splash_view.dart';
import '../services/get_it_service.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.registerScreen:
        return _buildRoute(
          BlocProvider(
            create: (_) => getIt<SignupCubit>(),
            child: const SignupView(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.bestSellingViews:
        return MaterialPageRoute(builder: (_) => const BestSellingViews());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }

  // this function act as native navigation for android and ios
  Route _buildRoute(Widget page, {bool useCupertino = false}) {
    if (useCupertino || TargetPlatform.iOS == defaultTargetPlatform) {
      return CupertinoPageRoute(builder: (_) => page);
    } else {
      return MaterialPageRoute(builder: (_) => page);
    }
  }
}
