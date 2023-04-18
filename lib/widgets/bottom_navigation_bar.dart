import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_navigation_bar_provider.dart';

class LearnerBottomNavigationBar extends StatelessWidget {
  const LearnerBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, value, child) {
      return BottomNavigationBar(
          currentIndex: value.index,
          onTap: (newValue) {
            value.setIndex(context, newValue);
          },
          selectedIconTheme: const IconThemeData(size: 30),
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "My Classes", icon: Icon(Icons.class_sharp)),
            BottomNavigationBarItem(label: "Account", icon: Icon(Icons.person)),
          ]);
    });
  }
}
