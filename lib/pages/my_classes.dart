import 'package:flutter/material.dart';
import 'package:learning_app/model/booked_classes.dart';
import 'package:learning_app/widgets/appBar.dart';
import '../utils/utils.dart';
import '../widgets/bottom_navigation_bar.dart';

class MyClassesPage extends StatelessWidget {
  const MyClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookedClassModel = BookedClassesModel();
    final bookedClassList = bookedClassModel.list;

    return Scaffold(
      appBar: LearningAppBar(title: "MY CLASSES"),
      body: ListView(
        children: [
          ...List.generate(
              bookedClassList.length,
              (index) => ClassesCard(
                  selectedClass: bookedClassList[index],
                  progressRate: bookedClassList[index].progressRate)).toList(),
        ],
      ),
      bottomNavigationBar: const LearnerBottomNavigationBar(),
    );
  }
}

class ClassesCard extends StatelessWidget {
  const ClassesCard({
    super.key,
    required this.selectedClass,
    required this.progressRate,
  });

  final BookedClasses selectedClass;
  final int progressRate;

  @override
  Widget build(BuildContext context) {
    double progressBar = ((145 * progressRate) / 100);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 2,
        child: SizedBox(
          height: 150,
          child: Row(
            children: [
              SizedBox(
                  height: double.infinity,
                  width: 160,
                  child: Image.asset(
                    "assets/images/${selectedClass.image}",
                    fit: BoxFit.fill,
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Faculty
                  Text(
                    (selectedClass.faculty.length >
                            18) // If faculty name is large, then...
                        ? "${selectedClass.faculty.substring(0, 20)}..." // show faculty name of 20 characters + .....
                        : selectedClass
                            .faculty, // otherwise, show full faculty name
                    style: TextStyle(
                      color: Utils.splashColor,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 10),

                  // Subject
                  Text(
                    selectedClass.subject,
                    style: TextStyle(
                        color: Utils.splashColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "$progressRate% Complete",
                    style: TextStyle(
                      color: Utils.splashColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                        color: Utils.splashColor,
                        borderRadius: BorderRadius.circular(20)),
                    width: progressBar,
                    height: 4,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
