import 'package:flutter/material.dart';
import 'package:learning_app/model/classes.dart';
import 'package:learning_app/pages/book_class.dart';
import 'package:learning_app/utils/utils.dart';
import 'package:learning_app/widgets/appBar.dart';
import 'package:learning_app/widgets/log_out.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/class_rounded_box.dart';
import '../widgets/learning_action_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final classModel = ClassModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearningAppBar(title: "HOME", action: const LogOut()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            welcomeBackText(),
            johnDoeText(),
            const SizedBox(height: 30),
            actionButtons(),
            const SizedBox(height: 35),
            lastClassesText(),
            const SizedBox(height: 20),
            slidableClassesBox(classModel: classModel)
          ],
        ),
      ),
      bottomNavigationBar: const LearnerBottomNavigationBar(),
    );
  }

  SingleChildScrollView slidableClassesBox({required ClassModel classModel}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // The spread operator (...) is used to insert each widget from the resulting list directly into the
          // ListView children list, instead of adding the list itself directly. This effectively "spreads" the
          // individual widgets into the list.
          ...List.generate(
            classModel.list.length,
            (index) {
              final classes = classModel.list[index];
              return ClassRoundedBox(
                image: classes.image,
                duration: classes.duration,
                faculty: classes.faculty,
                subject: classes.subject,
              );
            },
          ).toList(),
        ],
      ),
    );
  }

  Text lastClassesText() {
    return Text(
      "Last Classes",
      style: TextStyle(
        color: Utils.splashColor,
        fontSize: 30,
      ),
    );
  }

  Row actionButtons() {
    return Row(
      children: [
        LearningActionButton(
          title: "Book Class",
          onTap: () => Utils.navigatePushToPage(context, const BookClassPage()),
        ),
        const SizedBox(width: 15),
        LearningActionButton(title: "My Courses"),
      ],
    );
  }

  Text johnDoeText() {
    return Text(
      "John Doe",
      style: TextStyle(
        color: Utils.splashColor,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Text welcomeBackText() {
    return Text(
      "Welcome Back",
      style: TextStyle(
        color: Utils.splashColor,
        fontSize: 40,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
