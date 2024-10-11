import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'core/helpers/on_generate_routes.dart';
import 'features/splash/presentations/views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      locale: Locale('ar'), // Arabic locale
      supportedLocales: [
        Locale('ar'), // Only Arabic is supported
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
