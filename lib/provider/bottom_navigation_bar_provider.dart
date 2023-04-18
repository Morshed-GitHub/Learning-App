import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/my_classes.dart';
import '../pages/profile.dart';

class HomePageProvider with ChangeNotifier {
  int _index = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const MyClassesPage(),
    const ProfilePage()
  ];

  // Getter Method
  int get index => _index;
  List<Widget> get pages => _pages;

  void setIndex(BuildContext context, int value) {
    _index = value;
    notifyListeners(); // If any update occured
  }

  bool checkIfNotHomePage() {
    return (_index != 0);
  }

  Widget returnPage() {
    return _pages[_index];
  }
}
