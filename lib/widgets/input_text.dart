import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

class InputTextWidget extends StatelessWidget {
  InputTextWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.func,
    this.showVisibility = false,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String hint;
  VoidCallback func;
  bool showVisibility;
  bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return TextFormField(
            controller: controller,
            obscureText: isPassword ? value.passwordVisibility : false,

            // implementing a feature where the user can move to the "password" TextFormField by clicking the
            // "next" button on the keyboard after entering their "email".
            textInputAction:
                isPassword ? TextInputAction.done : TextInputAction.next,

            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: showVisibility
                  ? GestureDetector(
                      onTap: func,
                      child: Icon(
                        value.passwordVisibility
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                    )
                  : const SizedBox(),
            ),
          );
        },
      ),
    );
  }
}
