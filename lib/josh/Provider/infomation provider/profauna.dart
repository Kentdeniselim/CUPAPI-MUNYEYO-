import 'package:flutter/widgets.dart';
import '../../Information/Fauna_group/fauna info/elang jawa.dart';
import '../../Information/Fauna_group/fauna info/harimau.dart';
import '../../Information/Fauna_group/fauna info/jalakbali.dart';
import '../../Information/Fauna_group/fauna info/komodo.dart';
import '../../Information/Fauna_group/fauna info/penyu.dart';

class Prohewan with ChangeNotifier {
  List<Map<String, dynamic>> hewan = [
    {
      'nama': 'Komodo',
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.BxrkRN8AU3w9QQecLUn7pQHaE8&pid=Api&P=0&h=220',
      'kategori': 'darat',
      'placeholder': 'assets/logo.png',
      'page': Komodo(),
    },
    {
      'nama': 'Harimau Sumatera',
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.u-8qaO7UR7THtbEo6vzXkQHaEK&pid=Api&P=0&h=220',
      'kategori': 'darat',
      'placeholder': 'assets/logo.png',
      'page': Harimausumatera(),
    },
    {
      'nama': 'Elang Jawa',
      'image':
          'https://tse2.mm.bing.net/th?id=OIP.NpM_p2MNWcxhwtDcX2lxcwHaE8&pid=Api&P=0&h=220',
      'kategori': 'udara',
      'placeholder': 'assets/logo.png',
      'page': Elangjawa(),
    },
    {
      'nama': 'Jalak Bali',
      'image':
          'https://tse4.mm.bing.net/th?id=OIP.qs7ZpL5fOo9QL43mqGFk4QHaFj&w=355&h=355&c=7',
      'kategori': 'udara',
      'placeholder': 'assets/logo.png',
      'page': JalakBali(),
    },
    {
      'nama': 'Penyu',
      'image':
          'https://1.bp.blogspot.com/-rgGPGu5-wL0/X6JcDPOTl3I/AAAAAAAAFCc/kXpnCuctUFgpL3eLfWYy4jYoe_MOR8dTgCLcBGAsYHQ/s1168/gambar%2Bpenyu%2Bhijau-2.jpg',
      'kategori': 'air',
      'placeholder': 'assets/logo.png',
      'page': Penyu(),
    },
  ];

  // State untuk kategori dan pencarian
  String _kategoriTerpilih = 'semua'; // Default kategori
  String _searchQuery = ''; // Default pencarian

  // Getters untuk kategori dan pencarian
  String get kategoriTerpilih => _kategoriTerpilih;
  String get searchQuery => _searchQuery;

  // Method untuk mengubah kategori
  void setKategori(String kategori) {
    _kategoriTerpilih = kategori;
    notifyListeners();
  }

  // Method untuk mengubah pencarian
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // Getter untuk fauna yang sudah difilter berdasarkan kategori dan pencarian
  List<Map<String, dynamic>> get hewanTersaring {
    List<Map<String, dynamic>> filteredHewan;

    // Filter berdasarkan kategori
    if (_kategoriTerpilih == 'semua') {
      filteredHewan = hewan;
    } else {
      filteredHewan = hewan
          .where((item) =>
              item['kategori'].toLowerCase() == _kategoriTerpilih.toLowerCase())
          .toList();
    }

    // Filter berdasarkan pencarian
    if (_searchQuery.isNotEmpty) {
      filteredHewan = filteredHewan
          .where((item) =>
              item['nama'].toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }

    return filteredHewan;
  }

  // Method untuk menambah hewan
  void tambahHewan(Map<String, dynamic> data) {
    hewan.add(data);
    notifyListeners(); // Penting untuk update UI ketika ada perubahan data
  }
}
