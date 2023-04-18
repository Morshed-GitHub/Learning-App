import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

// ignore: must_be_immutable
class NavigatorButton extends StatelessWidget {
  NavigatorButton({
    super.key,
    required this.func,
    required this.action,
    this.isLoading = false,
  });

  final String action;
  VoidCallback func;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SizedBox(
          height: 50,
          width: 250,
          child: ElevatedButton(
            onPressed: func,
            child: Consumer<AuthProvider>(builder: (context, value, child) {
              return value.isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      action,
                      style: const TextStyle(fontSize: 16),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
