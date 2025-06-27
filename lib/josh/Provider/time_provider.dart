import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class TimeProvider with ChangeNotifier {
  String _currentTime = '';
  Timer? _timer;

  TimeProvider() {
    _startTimer();
  }

  String get currentTime => _currentTime;

  void _startTimer() {
    _updateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  void _updateTime() {
    _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
