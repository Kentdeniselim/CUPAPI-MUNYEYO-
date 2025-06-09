import 'package:flutter/widgets.dart';
import '../../Information/river/isi/barito.dart';
import '../../Information/river/isi/batanghari.dart';
import '../../Information/river/isi/kapuas.dart';
import '../../Information/river/isi/mahakam.dart';

class Proriver with ChangeNotifier {
  List<Map<String, dynamic>> _allRiver = [
    {
      'nama': 'Sungai Barito',
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.rjPOKiu1sgQ5wJOd9nqjZgHaEK&w=266&h=266&c=7',
      'placeholder': 'assets/logo.png',
      'page': Barito(),
    },
    {
      'nama': 'Sungai Batanghari',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.ASrkBw24QNmhwUhNGvHFpgHaJQ&w=474&h=474&c=7',
      'placeholder': 'assets/logo.png',
      'page': BatangHari(),
    },
    {
      'nama': 'Sungai Kapuas',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUg06CTi4NevuJj14xYEgovs528b00jUVF_w&s',
      'kategori': 'udara',
      'placeholder': 'assets/logo.png',
      'page': Kapuas(),
    },
    {
      'nama': 'Sungai Mahakam',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.z0g5ZB2Rh5vi7rO1TG8eFwHaE8&w=316&h=316&c=7',
      'placeholder': 'assets/logo.png',
      'page': Mahakam(),
    },
  ];

  List<Map<String, dynamic>> river = [];

  Proriver() {
    river = _allRiver; // Initialize with all rivers
  }

  void search(String query) {
    if (query.isEmpty) {
      river = _allRiver;
    } else {
      river = _allRiver
          .where((riverItem) =>
              riverItem['nama'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void tambahriver(Map<String, dynamic> data) {
    _allRiver.add(data);
    river = _allRiver;
    notifyListeners();
  }
}
