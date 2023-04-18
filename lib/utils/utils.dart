import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static const Color _splashColor = Color(0xff874FCF);

  // Getter Method
  static Color get splashColor => _splashColor;

  // Navigator Methods
  static void navigatePushToPage(
      BuildContext context, Widget targetPage) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => targetPage),
    );
  }

  static void navigatePushReplaceToPage(
      BuildContext context, Widget targetPage) async {
    await Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (context) => targetPage),
    );
  }

  static navigatePop(BuildContext context) {
    Navigator.pop(context);
  }

  // Flutter Toast
  static toastMessage(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      backgroundColor: splashColor,
      fontSize: 16,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // Development Message
  static showDevelopmentRunningMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Utils.toastMessage(
              "That functionality is still in development, so stay tuned! 🔔")),
    );
  }
}
