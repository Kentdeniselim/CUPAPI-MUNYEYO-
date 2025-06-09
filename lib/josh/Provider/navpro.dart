import 'package:flutter/material.dart';

class Navpro with ChangeNotifier {
  int _currentindex = 0;

  int get currentindex => _currentindex;

  void setindex(int index) {
    _currentindex = index;
    notifyListeners();
  }
}
