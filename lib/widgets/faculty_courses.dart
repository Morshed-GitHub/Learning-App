import 'package:flutter/material.dart';

import '../model/classes.dart';
import '../utils/utils.dart';

class FacultyCourses extends StatelessWidget {
  const FacultyCourses({
    super.key,
    required this.selectedClass,
    required this.courses,
  });

  final Class selectedClass;
  final int courses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 160,
      child: Column(
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.asset(
              "assets/images/${selectedClass.image}",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (selectedClass.faculty.length > 20)
                    ? "${selectedClass.faculty.substring(0, 20)}..."
                    : selectedClass.faculty,
                style: TextStyle(color: Utils.splashColor),
              ),
              const SizedBox(height: 10),
              Text(
                "$courses Courses",
                style: TextStyle(color: Utils.splashColor, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}
