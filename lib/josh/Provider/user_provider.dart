import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _nickname = 'Cupapi Munyenyo';

  String get nickname => _nickname;

  void changeNickname(String newNickname) {
    _nickname = newNickname;
    notifyListeners();
  }
}