import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/custom_bloc_observer.dart';
import 'core/utils/app_color.dart';
import 'core/helpers/on_generate_routes.dart';
import 'core/services/get_it_service.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'features/splash/presentations/views/splash_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up custom Bloc observer for debugging and state tracking
  Bloc.observer = CustomBlocObserver();

  // Initialize Firebase and Shared Preferences
  await initializeFirebase();
  await Prefs.init();

  // Set up GetIt for dependency injection
  setUpGetIt();

  // Run the main app
  runApp(const FruitHub());
}

// Function to initialize Firebase
Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub',
      debugShowCheckedModeBanner: false,

      // Set app theme using a separate function
      theme: _buildAppTheme(),

      // Define routes and the initial route (Splash screen)
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,

      // Define locale as Arabic and restrict app to Arabic language
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],

      // Define localization delegates for Arabic support
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  // Function to build app theme
  ThemeData _buildAppTheme() {
    return ThemeData(
      fontFamily: 'Cairo',
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColor.primaryColor,
      ),
    );
  }
}
