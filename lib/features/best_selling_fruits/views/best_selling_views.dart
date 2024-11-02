import 'package:flutter/material.dart';

import '../../../core/widgets/build_appbar.dart';

import 'widgets/best_selling_view_body.dart';

class BestSellingViews extends StatelessWidget {
  const BestSellingViews({super.key});

  static const String routeName = 'bestSellingViews';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,title: 'الاكثر مبيعاً'),
      body: const BestSellingViewBody(),
    );
  }
}
