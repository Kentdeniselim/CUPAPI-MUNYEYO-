import 'dart:typed_data'; // Import pustaka ini
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _nickname = 'Cupapi Munyenyo';
  Uint8List? _profileImage; // Tambahkan variabel untuk gambar profil

  String get nickname => _nickname;
  Uint8List? get profileImage => _profileImage; // Tambahkan getter

  void changeNickname(String newNickname) {
    _nickname = newNickname;
    notifyListeners();
  }

  // Tambahkan fungsi untuk mengubah gambar profil
  void changeProfilePicture(Uint8List newImage) {
    _profileImage = newImage;
    notifyListeners();
  }
}
