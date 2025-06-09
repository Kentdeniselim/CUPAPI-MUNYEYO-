import 'package:flutter/material.dart';
import '../../Information/flora_group/flora_info/Bunga Gardenia.dart';
import '../../Information/flora_group/flora_info/anggrekhitam.dart';
import '../../Information/flora_group/flora_info/edelweiss.dart';
import '../../Information/flora_group/flora_info/michelia.dart';
import '../../Information/flora_group/flora_info/raflessia.dart';

class Proflora with ChangeNotifier {
  List<Map<String, dynamic>> flora = [
    {
      'nama': 'Bunga Gardenia',
      'image':
          'https://live.staticflickr.com/5803/22583644456_c934c686f3_b.jpg',
      'placeholder': 'assets/logo.png',
      'page': BungaGardenia(),
    },
    {
      'nama': 'Rafflesia arnoldii',
      'image': 'https://c1.staticflickr.com/7/6054/6265508839_e674f9dc5c_b.jpg',
      'placeholder': 'assets/logo.png',
      'page': Raflessia(),
    },
    {
      'nama': 'Anggrek Hitam',
      'image':
          'https://4.bp.blogspot.com/-wMvaqw-WWOA/V6wI_ysxzZI/AAAAAAAABYk/v5QDXzfLZf4PkcALZOTHlNO6S9sNQdyPgCLcB/s1600/Gambar%2BBunga%2BAnggrek%2BHitam%2B%2528Black%2BOrchid%2BFlowers%2529%2B10000.jpg',
      'placeholder': 'assets/logo.png',
      'page': AnggrekHitam(),
    },
    {
      'nama': 'Bunga Edel Weiss',
      'image':
          'https://tse2.mm.bing.net/th/id/OIP.YsDWuZi7YdBuAZEKZbavSwHaFj?w=355&h=355&c=7',
      'placeholder': 'assets/logo.png',
      'page': Edelweiss(),
    },
    {
      'nama': 'Bunga Michelia',
      'image':
          'https://tse1.mm.bing.net/th?id=OIP.3zlCknrl59iF1M76-ltfJQHaFj&pid=Api&P=0&h=220',
      'placeholder': 'assets/logo.png',
      'page': Michelia(),
    },
  ];

  String _searchQuery = '';

  String get searchQuery => _searchQuery;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  List<Map<String, dynamic>> get floraTersaring {
    if (_searchQuery.isEmpty) {
      return flora;
    } else {
      return flora
          .where((item) =>
              item['nama'].toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  void tambahflora(Map<String, dynamic> data) {
    flora.add(data);
    notifyListeners();
  }
}
