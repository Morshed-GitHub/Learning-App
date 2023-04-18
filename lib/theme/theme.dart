import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LearningAppTheme {
  static ThemeData light() => ThemeData(
        // CirculaProgressIndicator Part
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),

        // AppBar Part
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Utils.splashColor,
            size: 26,
          ),
        ),

        // ElevatedButton Part
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            elevation: MaterialStateProperty.all(12),
            backgroundColor: MaterialStateProperty.all(Utils.splashColor),
          ),
        ),

        // BottomNavigationBar Part
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Utils.splashColor,
          unselectedItemColor: Utils.splashColor,
        ),

        // Icon Part
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        // Scaffold Background Color Part
        scaffoldBackgroundColor: Colors.white,

        // ChipThemeData Part
        chipTheme: ChipThemeData(
          elevation: 5,
          labelStyle: const TextStyle(color: Colors.white),
          side: BorderSide(width: 1.2, color: Utils.splashColor),
          backgroundColor: Colors.white,
          selectedColor: Utils.splashColor,
        ),

        // TextInputForm Part 1
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: Utils.splashColor,

          // Enable
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Utils.splashColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),

          // Focused
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Utils.splashColor, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        // TextFormField Part 2
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Utils.splashColor,
        ),

        // ExpansionTile Part
        expansionTileTheme: ExpansionTileThemeData(
          tilePadding: const EdgeInsets.only(left: 15, right: 28),
          textColor: Utils.splashColor,
          iconColor: Utils.splashColor,
          collapsedIconColor: Utils.splashColor,
          collapsedTextColor: Utils.splashColor,
        ),

        // ListTile Part
        listTileTheme: ListTileThemeData(
          minVerticalPadding: 0, // Reduce vertical space of each ExpansionTile
          iconColor: Utils.splashColor,
          textColor: Utils.splashColor,
        ),

        // Alert Dialouge TextButton Part
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          // shadowColor: MaterialStateProperty.all(Utils.splashColor),
          overlayColor: MaterialStateProperty.all(
              Utils.splashColor.withOpacity(.1)), // Button Splash Color
          foregroundColor:
              MaterialStateProperty.all(Utils.splashColor), // Button Color
        )),

        // Check Box Part
        checkboxTheme: CheckboxThemeData(
            side: BorderSide(color: Utils.splashColor, width: 1.5)),
      );
}
