import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/utils/app_color.dart';
import 'featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: width-32,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(children: [
            Positioned(
              left: 0,
              bottom: 0,
              top: 0,
              right: width * .4,
              child: SvgPicture.asset(
                '$imagesPath/page_view_item2_image.svg',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: width * .5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: svg.Svg('$imagesPath/featured_item_background.svg'),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      'عروض العيد',
                      style:
                          TextStyles.regular13.copyWith(color: AppColor.white),
                    ),
                    const Spacer(),
                    Text(
                      'خصم 20%',
                      style: TextStyles.bold19.copyWith(color: AppColor.white),
                    ),
                    const SizedBox(height: 11),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                    const SizedBox(height: 29),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
