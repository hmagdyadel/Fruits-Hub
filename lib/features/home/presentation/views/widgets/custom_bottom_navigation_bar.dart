import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_color.dart';
import 'package:fruits/features/home/domain/entities/bottom_navigation_bar.dart';

import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: const ShapeDecoration(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            spreadRadius: 0,
            blurRadius: 25,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarList.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return Expanded(
            flex: index==selectedIndex?3:2 ,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex=index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.bounceOut,
                child: NavigationBarItem(
                  isSelected: selectedIndex==index,
                  bottomNavigationBarEntity: item,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}






