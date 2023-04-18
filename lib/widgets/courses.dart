import 'package:flutter/material.dart';

import '../model/classes.dart';
import '../utils/utils.dart';

class Courses extends StatelessWidget {
  const Courses({
    super.key,
    required this.classModel,
  });

  final Class classModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SizedBox(
        height: 180,
        width: 160,
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: double.infinity,
              child: Image.asset(
                "assets/images/${classModel.image}",
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ("Arts & Humanities"),
                  style: TextStyle(color: Utils.splashColor),
                ),
                const SizedBox(height: 6),
                Text(
                  (classModel.subject),
                  style: TextStyle(color: Utils.splashColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
