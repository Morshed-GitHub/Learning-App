import 'package:flutter/material.dart';

import '../utils/utils.dart';

class LearningActionButton extends StatelessWidget {
  LearningActionButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (onTap == null)
          ? () {
              Utils.showDevelopmentRunningMessage(context);
            }
          : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
