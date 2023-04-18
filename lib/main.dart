import 'package:flutter/material.dart';
import 'package:learning_app/pages/splash.dart';
import 'package:learning_app/provider/auth_provider.dart';
import 'package:learning_app/provider/book_class_provider.dart';
import 'package:learning_app/provider/bottom_navigation_bar_provider.dart';
import 'package:learning_app/provider/choice_chip_provider.dart';
import 'package:learning_app/provider/expansion_tile_provider.dart';
import 'package:provider/provider.dart';
import 'theme/theme.dart';

void main() {
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => ChoiceChipProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ExpansionTileProvider()),
        ChangeNotifierProvider(create: (context) => BookClassProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LearningAppTheme.light(),
        home: const SplashPage(),
      ),
    );
  }
}
