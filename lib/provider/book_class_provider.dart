import 'package:flutter/material.dart';
import 'package:learning_app/model/booked_classes.dart';

class BookClassProvider with ChangeNotifier {
  String? _selectedOption;
  String? _selectedClassTypeOption;
  final _bookedClassModel = BookedClassesModel;
  final List<String> _classTypes = [
    "Group Study",
    "Mentorship Program",
    "Personal Tutor",
    "Self Study"
  ];

  // Getter Method
  String? get selectedOption => _selectedOption;
  String? get selectedClassTypeOption => _selectedClassTypeOption;
  List<String> get classTypes => _classTypes;

  void setValue(String? newValue) {
    _selectedOption = newValue.toString();
    notifyListeners(); // Notify if any update occured
  }

  void setClassTypeOption(String? newOption) {
    _selectedClassTypeOption = newOption.toString();
    notifyListeners(); // Notify if any update occured
  }

  // void addToBookedClassesList() {
  //   _bookedClassModel.
  //   _selectedOption;
  // }
}
