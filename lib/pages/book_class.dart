import 'package:flutter/material.dart';
import 'package:learning_app/model/booked_classes.dart';
import 'package:learning_app/model/classes.dart';
import 'package:learning_app/provider/book_class_provider.dart';
import 'package:learning_app/widgets/appBar.dart';
import 'package:learning_app/widgets/navigator_button.dart';
import 'package:provider/provider.dart';
import '../provider/choice_chip_provider.dart';
import '../utils/utils.dart';
import '../widgets/courses.dart';
import '../widgets/faculty_courses.dart';

class BookClassPage extends StatelessWidget {
  const BookClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChoiceChipProvider>(context, listen: false);
    final classModelList = ClassModel().list;

    void addSelectedClass() {
      final classModel = ClassModel();
      final bookedClassModel = BookedClassesModel();
      final bookClassProvider =
          Provider.of<BookClassProvider>(context, listen: false);
      final selectedClass =
          classModel.searchClassBySubject(bookClassProvider.selectedOption!);

      // Check if subject already exists in booked classes list
      if (bookedClassModel.list
          .any((element) => element.subject == selectedClass.subject)) {
        Utils.toastMessage("Course already added ✔");
      } else {
        // if subject not present in booked classes then add it to the list
        BookedClassesModel.addClass(BookedClasses(
            image: selectedClass.image,
            progressRate: 0,
            faculty: selectedClass.faculty,
            subject: selectedClass.subject));
        Utils.toastMessage("Course added succesfully ✔");
      }
    }

    return Scaffold(
      appBar:
          LearningAppBar(title: "BOOK YOUR CLASS", isBackButtonEnabled: true),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          scrollableFacultyCourses(classModelList),
          const SizedBox(height: 20),
          dropDownButtons(classModelList),
          const SizedBox(height: 20),
          artsAndHumanityCoursesColumn(classModelList),
          const AskingSurityCheckBox(),
          const SizedBox(height: 10),
          NavigatorButton(
              func: () {
                provider.checkSelectionBox()
                    ? Utils.toastMessage("Please select the checkbox first")
                    : addSelectedClass();
              },
              action: "Book Class Now"),
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  Column artsAndHumanityCoursesColumn(List<Class> classModelList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        artsAndHumanitiesText(classModelList),
        const SizedBox(height: 10),
        slidableCourses(classModelList),
      ],
    );
  }

  SingleChildScrollView slidableCourses(List<Class> classModelList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              ...List.generate(4,
                      (index) => Courses(classModel: classModelList[index + 4]))
                  .toList(),
            ],
          ),
        ],
      ),
    );
  }

  Padding artsAndHumanitiesText(List<Class> classModelList) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        classModelList[0].faculty,
        style: TextStyle(
            color: Utils.splashColor,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  SingleChildScrollView dropDownButtons(List<Class> classModelList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            selectClassDropDownButton(classModelList),
            const SizedBox(width: 30),
            classTypeDropDownButton(classModelList),
          ],
        ),
      ),
    );
  }

  Column classTypeDropDownButton(List<Class> classModelList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Class Type",
          style: TextStyle(
              color: Utils.splashColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Consumer<BookClassProvider>(
          builder: (context, value, child) => DropdownButton(
            value: value.selectedClassTypeOption,
            hint: Text(
              value.classTypes[0],
              style: TextStyle(color: Utils.splashColor),
            ),
            dropdownColor: Colors.white,
            iconEnabledColor: Utils.splashColor,
            items: value.classTypes.map((types) {
              return DropdownMenuItem(
                value: types,
                child: Text(
                  types,
                  style: TextStyle(color: Utils.splashColor),
                ),
              );
            }).toList(),
            onChanged: value.setClassTypeOption,
          ),
        ),
      ],
    );
  }

  Column selectClassDropDownButton(List<Class> classModelList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Class",
          style: TextStyle(
              color: Utils.splashColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Consumer<BookClassProvider>(
          builder: (context, value, child) => DropdownButton(
            value: value.selectedOption,
            dropdownColor: Colors.white,
            iconEnabledColor: Utils.splashColor,
            hint: Text(classModelList[0].subject,
                style: TextStyle(color: Utils.splashColor)),
            items: classModelList.map((model) {
              return DropdownMenuItem(
                value: model.subject,
                child: Text(
                  model.subject,
                  style: TextStyle(color: Utils.splashColor),
                ),
              );
            }).toList(),
            onChanged: value.setValue,
          ),
        ),
      ],
    );
  }

  SingleChildScrollView scrollableFacultyCourses(List<Class> classModelList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FacultyCourses(selectedClass: classModelList[0], courses: 12),
          FacultyCourses(selectedClass: classModelList[3], courses: 14),
          FacultyCourses(selectedClass: classModelList[5], courses: 5),
          FacultyCourses(selectedClass: classModelList[1], courses: 8),
          FacultyCourses(selectedClass: classModelList[4], courses: 16),
        ],
      ),
    );
  }
}

class AskingSurityCheckBox extends StatelessWidget {
  const AskingSurityCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Consumer<ChoiceChipProvider>(
        builder: (context, provider, child) => CheckboxListTile(
          title: Text(
            'Are you sure with selected Class?',
            style: TextStyle(
                color: Utils.splashColor, fontWeight: FontWeight.w500),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          value: provider.classBookingSurityChecked,
          activeColor: Utils.splashColor,
          checkColor: Colors.white,
          onChanged: (value) {
            provider.toggleclassBookingSurityCheckBoxSelection(value);
          },
        ),
      ),
    );
  }
}
