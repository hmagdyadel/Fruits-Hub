import 'package:flutter/material.dart';


import '../../features/best_selling_fruits/views/best_selling_views.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentations/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case BestSellingViews.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingViews());
    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
