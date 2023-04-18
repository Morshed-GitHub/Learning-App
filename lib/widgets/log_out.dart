import 'package:flutter/material.dart';
import 'package:learning_app/pages/login.dart';
import 'package:learning_app/utils/utils.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Utils.navigatePushReplaceToPage(context, const LoginPage());
      },
      icon: const Icon(Icons.logout_outlined),
    );
  }
}
