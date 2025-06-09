import 'package:flutter/widgets.dart';

import '../../Information/lake/lake info/Toba.dart';
import '../../Information/lake/lake info/poso.dart';
import '../../Information/lake/lake info/tempe.dart';
import '../../Information/lake/lake info/towuti.dart';

class Prolake with ChangeNotifier {
  List<Map<String, dynamic>> lake = [
    {
      'nama': 'Danau Poso',
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.PaOWjJ1VW19RYb3F7113dQHaEK&pid=Api&P=0&h=220',
      'placeholder': 'assets/logo.png',
      'page': Poso(),
    },
    {
      'nama': 'Danau Tempe',
      'image':
          'https://tse3.mm.bing.net/th?id=OIP.epaPW0Kubfu_T_0ladRN_gHaFj&w=355&h=355&c=7',
      'placeholder': 'assets/logo.png',
      'page': Tempe(),
    },
    {
      'nama': 'Danau Toba',
      'image':
          'https://asset.kompas.com/crops/PZkNa1XEcC9huIv3Gd1tHebvzIA=/0x0:780x520/1200x800/data/photo/2023/07/25/64bf6a78dfe73.jpg',
      'placeholder': 'assets/logo.png',
      'page': Toba(),
    },
    {
      'nama': 'Danau Towuti',
      'image':
          'https://tse1.mm.bing.net/th/id/OIP.zxN0nrBHh_ignslgSSeOIgHaE_?w=319&h=319&c=7',
      'placeholder': 'assets/logo.png',
      'page': Towuti(),
    },
  ];

  // === Tambahan untuk fitur search ===
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Map<String, dynamic>> get lakeTersaring {
    if (_searchQuery.isEmpty) {
      return lake;
    } else {
      return lake
          .where((item) =>
              item['nama'].toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  void tambahlake(Map<String, dynamic> data) {
    lake.add(data);
    notifyListeners();
  }
}
