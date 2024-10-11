import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PageViewItem extends StatelessWidget {
  final String imagePath, backgroundColor, subTitle;
  final Widget title;
  final bool isVisible;

  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
    required this.subTitle,
    required this.title,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundColor,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  imagePath,
                ),
              ),
               Visibility(
                visible: isVisible,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('تخط'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
