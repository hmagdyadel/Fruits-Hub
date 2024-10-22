import 'package:flutter/material.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/widgets/fruit_item.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'best_selling_header.dart';
import 'custom_home_appbar.dart';
import 'featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: horizontalPadding),
                CustomHomeAppbar(),
                SizedBox(height: horizontalPadding),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                FruitItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
