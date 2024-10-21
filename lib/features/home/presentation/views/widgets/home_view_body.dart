import 'package:flutter/material.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/widgets/search_text_field.dart';
import 'custom_home_appbar.dart';

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
                const SizedBox(height: horizontalPadding),
                CustomHomeAppbar(),
                const SizedBox(height: horizontalPadding),
                SearchTextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
