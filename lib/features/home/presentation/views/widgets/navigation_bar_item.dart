import 'package:flutter/material.dart';

import '../../../domain/entities/bottom_navigation_bar.dart';
import 'active_item.dart';
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            title: bottomNavigationBarEntity.name,
            image: bottomNavigationBarEntity.activeImage)
        : InActiveItem(image: bottomNavigationBarEntity.inactiveImage);
  }
}
