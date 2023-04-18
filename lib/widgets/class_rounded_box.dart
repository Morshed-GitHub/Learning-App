import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ClassRoundedBox extends StatelessWidget {
  const ClassRoundedBox({
    super.key,
    required this.image,
    required this.faculty,
    required this.subject,
    required this.duration,
  });

  final String image;
  final String faculty;
  final String subject;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 210,
          width: 250,
          decoration: BoxDecoration(
              color: Colors.white,

              // Border Decoration
              border: Border(
                  top: BorderSide(
                      color: Utils.splashColor, style: BorderStyle.solid),
                  right: BorderSide(
                      color: Utils.splashColor, style: BorderStyle.solid),
                  left: BorderSide(
                      color: Utils.splashColor, style: BorderStyle.solid),
                  bottom: BorderSide(
                      color: Utils.splashColor, style: BorderStyle.solid))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              SizedBox(
                height: 110,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    "assets/images/$image",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Faculty
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5),
                child: Text(
                  faculty,
                  style: TextStyle(color: Utils.splashColor, fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),

              // Subject
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subject,
                      style: TextStyle(
                          color: Utils.splashColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      duration,
                      style: TextStyle(
                        color: Utils.splashColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
