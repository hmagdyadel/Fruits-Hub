import 'package:flutter/cupertino.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/plant.svg'),
          ],
        ),
        SvgPicture.asset('assets/images/logo.svg'),
        SvgPicture.asset('assets/images/splash_bottom.svg',fit: BoxFit.fill,),
      ],
    );
  }
}
