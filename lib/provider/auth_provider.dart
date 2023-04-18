import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:learning_app/utils/utils.dart';
import '../pages/level_query.dart';

class AuthProvider with ChangeNotifier {
  // Private Access Modifier
  final String _url = "https://reqres.in/api/login";
  bool _isLoading = false;
  bool _isPasswordVisible = true;

  // Getter Methods
  bool get isLoading => _isLoading;
  bool get passwordVisibility => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners(); // Notify if any update occured
  }

  void login(context, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners(); // Notify if any updates occured
      final response = await http
          .post(Uri.parse(_url), body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        _isLoading = false;
        notifyListeners(); // Notify if any updates occured

        Utils.navigatePushReplaceToPage(context, const LevelQuery());
        Utils.toastMessage("Login Successful ✓");
      } else {
        _isLoading = false;
        notifyListeners(); // Notify if any updates occured
        Utils.toastMessage("Login Failed!");
      }
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      Utils.toastMessage(error.toString());
    }
  }
}
