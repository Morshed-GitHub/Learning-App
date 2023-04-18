import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bottom_navigation_bar_provider.dart';

class CentralPage extends StatelessWidget {
  const CentralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, value, child) {
      return (value.returnPage());
    });
  }
}
