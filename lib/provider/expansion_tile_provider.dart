import 'package:flutter/material.dart';

class ExpansionTileProvider with ChangeNotifier {
  bool _isExpanded = false;
  String? _currentSetting;

  // Getter Methods
  bool get expanded => _isExpanded;
  String? get setting => _currentSetting;

  void updatedExpansionStatus({required bool value, required String setting}) {
    _isExpanded = value;
    _currentSetting = setting;
    notifyListeners(); // Notify if any updated occured
  }

  static Future<void> showDeletionConfirmationDialog(
      BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          true, // In order to dismissed the dialog by tapping on the screen (outside of the dialog)
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Do you want to delete your account?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // Perform deletion operation here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
