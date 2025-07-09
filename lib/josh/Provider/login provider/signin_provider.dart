import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  String _name = '';
  String _password = '';
  bool _isLoading = true;

  String get name => _name;
  String get password => _password;
  bool get isLoading => _isLoading;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> startLoading() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 2000));
    _isLoading = false;
    notifyListeners();
  }

  /// Validasi inputan
  bool validate() {
    return _name.isNotEmpty && isPasswordValid();
  }

  /// Password harus minimal 5 kata
  bool isPasswordValid() {
    return _password.trim().split(RegExp(r'\s+')).length >= 5;
  }

  void reset() {
    _name = '';
    _password = '';
    notifyListeners();
  }
}
