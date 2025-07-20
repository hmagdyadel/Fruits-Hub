import 'package:flutter/material.dart';

import 'widgets/on_boarding_view_body.dart';

class OnBoardingScreen extends StatelessWidget {

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingViewBody(
        
        ),
      ),
    );
  }
}
