import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';
import 'core/services/custom_bloc_observer.dart';
import 'core/services/get_it_service.dart';
import 'core/services/shared_preferences_singleton.dart';
import 'firebase_options.dart';
import 'fruit_hub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = CustomBlocObserver();

  // Initialize Firebase and Shared Preferences
  await initializeFirebase();
  await Prefs.init();

  // Set up GetIt for dependency injection
  setUpGetIt();

  // Run the main app
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      saveLocale: true,
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      child: FruitHub(
        appRouter: AppRouter(),
      ),
    ),
  );
}

// Function to initialize Firebase
Future<void> initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
