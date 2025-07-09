import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class SignUpProvider extends ChangeNotifier {
  String _email = '';
  String _username = '';
  String _password = '';
  String _confirmPassword = '';
  String _phone = '';

  Country _selectedCountry = Country(
    phoneCode: '62',
    countryCode: 'ID',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Indonesia',
    example: '81234567890',
    displayName: 'Indonesia',
    displayNameNoCountryCode: 'Indonesia',
    e164Key: '',
  );

  bool _isLoading = true;

  // Getters
  String get email => _email;
  String get username => _username;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  String get phone => _phone;
  Country get selectedCountry => _selectedCountry;
  bool get isLoading => _isLoading;

  // Setters
  void setEmail(String val) {
    _email = val;
    notifyListeners();
  }

  void setUsername(String val) {
    _username = val;
    notifyListeners();
  }

  void setPassword(String val) {
    _password = val;
    notifyListeners();
  }

  void setConfirmPassword(String val) {
    _confirmPassword = val;
    notifyListeners();
  }

  void setPhone(String val) {
    _phone = val;
    notifyListeners();
  }

  void setCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }

  Future<void> startLoading() async {
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }

  bool validateForm(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  bool isPasswordMatch() {
    return _password == _confirmPassword;
  }

  /// Count number of **words** in password (split by whitespace)
  bool isPasswordValid() {
    return _password.trim().split(RegExp(r'\s+')).length >= 5;
  }

  void reset() {
    _email = '';
    _username = '';
    _password = '';
    _confirmPassword = '';
    _phone = '';
    notifyListeners();
  }
}
