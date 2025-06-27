import 'package:flutter/material.dart';

class BookmarkProvider with ChangeNotifier {
  final List<Map<String, String>> _bookmarks = [];

  List<Map<String, String>> get bookmarks => _bookmarks;

  void toggleBookmark(Map<String, String> item) {
    final existingIndex =
        _bookmarks.indexWhere((b) => b['title'] == item['title']);
    if (existingIndex >= 0) {
      _bookmarks.removeAt(existingIndex);
    } else {
      _bookmarks.add(item);
    }
    notifyListeners();
  }

  bool isBookmarked(String title) {
    return _bookmarks.any((item) => item['title'] == title);
  }

  // --- START NEW CODE ---
  void clearAllBookmarks() {
    _bookmarks.clear();
    notifyListeners();
  }
  // --- END NEW CODE ---
}
