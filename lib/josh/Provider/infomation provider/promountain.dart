import 'package:flutter/widgets.dart';

import '../../Information/mountain/mountain info/kerinci.dart';
import '../../Information/mountain/mountain info/puncakjaya.dart';
import '../../Information/mountain/mountain info/rinjani.dart';
import '../../Information/mountain/mountain info/semeru.dart';

class Promountain with ChangeNotifier {
  final List<Map<String, dynamic>> _allMountain = [
    {
      'nama': 'Gunung Kerinci',
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.mvTI2p067rwgb9Cn_ZagVQHaE6&pid=Api&P=0&h=220',
      'placeholder': 'assets/logo.png',
      'page': Kerinci(),
    },
    {
      'nama': 'Puncak Jaya',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ05aOg90voUUOz7CpSKGmi1STTbXbDhCBX886clx0hnCAvBIY6RokruwNt7Z_pGdDfKNU&usqp=CAU',
      'placeholder': 'assets/logo.png',
      'page': Puncakjaya(),
    },
    {
      'nama': 'Gunung Rinjani',
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.DH8Be3S1MgSzqTG-jsMSXAHaE8&pid=Api&P=0&h=220',
      'placeholder': 'assets/logo.png',
      'page': Rinjani(),
    },
    {
      'nama': 'Gunung Semeru',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.8EREzqcEMVVHDFy-a0rS1gHaE8&pid=Api&P=0&h=220',
      'placeholder': 'assets/logo.png',
      'page': Semeru(),
    },
  ];

  List<Map<String, dynamic>> _filteredMountain = [];

  Promountain() {
    _filteredMountain = List.from(_allMountain);
  }

  List<Map<String, dynamic>> get mountain => _filteredMountain;

  void search(String query) {
    if (query.isEmpty) {
      _filteredMountain = List.from(_allMountain);
    } else {
      _filteredMountain = _allMountain
          .where((item) =>
              item['nama'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void tambahmountain(Map<String, dynamic> data) {
    _allMountain.add(data);
    search('');
    notifyListeners();
  }
}
