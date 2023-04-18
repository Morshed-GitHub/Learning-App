import 'package:flutter/material.dart';
import 'package:learning_app/model/classes.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class ChoiceChipProvider with ChangeNotifier {
  int _selectedIndex = -1;
  bool? _isChecked = false;
  bool? _isRememberMeChecked = false;
  bool? _classBookingSurityChecked = false;
  final List<String> _options = ['Beginner', 'Intermediate', 'Expert'];

  // Getter Method
  int get selectedIndex => _selectedIndex;
  List<String> get options => _options;
  bool? get isChecked => _isChecked;
  bool? get isRememberMeChecked => _isRememberMeChecked;
  bool? get classBookingSurityChecked => _classBookingSurityChecked;

  get classModel => ClassModel();

  // Choice Chip Part - [beginner, intermediate, expert]
  void toggleChoiceChipSelection({required bool selected, required int index}) {
    _selectedIndex = selected ? index : -1;
    notifyListeners(); // Notify if any update
  }

  bool checkIndex({required int index}) {
    return (selectedIndex == index);
  }

  // CheckBoxListTile Part - LevelQuery
  void toggleCheckBoxSelection(bool? value) {
    _isChecked = value;
    notifyListeners(); // Notify if any update occured
  }

  // CheckBoxListTile Part - Login
  void toggleRememberMeCheckBoxSelection(bool? value) {
    _isRememberMeChecked = value;
    notifyListeners(); // Notify if any update occured
  }

  // CheckBoxListTile Part - Login
  void toggleclassBookingSurityCheckBoxSelection(bool? value) {
    _classBookingSurityChecked = value;
    notifyListeners(); // Notify if any update occured
  }

  bool checkIfLevelNotSelected() {
    return (_selectedIndex == -1);
  }

  bool checkIfSelectionBoxNotSelected() {
    return ((_isChecked == false));
  }

  bool checkSelectionBox() {
    return (_classBookingSurityChecked == false);
  }
}
