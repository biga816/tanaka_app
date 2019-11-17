import 'package:flutter/material.dart';

class TabIconData {
  IconData icon;

  bool isSelected;
  int index;
  AnimationController animationController;

  TabIconData({
    this.icon,
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  static List<TabIconData> tabIconsList = [
    TabIconData(
      icon: Icons.home,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.list,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.laptop_mac,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: Icons.person,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
