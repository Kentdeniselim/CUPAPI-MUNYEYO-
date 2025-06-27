// lib/josh/Provider/navigation.dart
import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Theme.dart';
import 'package:praktek2/josh/Provider/navpro.dart';
import 'package:praktek2/josh/screen/Home.dart';
import 'package:praktek2/josh/screen/acc.dart';
import 'package:praktek2/josh/screen/bookmarkpage.dart';
import 'package:provider/provider.dart';
import '../Provider/Bookmarkpro.dart'; // Import BookmarkProvider

// Provider untuk navigasi
class MainNavigationProvider with ChangeNotifier {
  // Ini sepertinya duplikat dengan Navpro, mungkin bisa dihapus salah satunya
  int _currentindex = 0;

  int get currentindex => _currentindex;

  void setindex(int index) {
    _currentindex = index;
    notifyListeners();
  }
}

// Provider untuk theme
class ThemeProvider with ChangeNotifier {
  // Ini sepertinya duplikat dengan ThemePro, mungkin bisa dihapus salah satunya
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}

// MainNavigation widget
class MainNavigation extends StatelessWidget {
  MainNavigation({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    const Home(),
    BookmarkPage(), // Indeks 1 adalah BookmarkPage
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider =
        Provider.of<Navpro>(context); // Menggunakan Navpro
    final themeProvider =
        Provider.of<ThemePro>(context); // Menggunakan ThemePro
    final bookmarkProvider =
        Provider.of<BookmarkProvider>(context); // Akses BookmarkProvider

    return Scaffold(
      appBar: AppBar(
        title: Text(
          // Mengubah judul AppBar berdasarkan halaman saat ini
          navigationProvider.currentindex == 0
              ? 'RimbaFamily'
              : navigationProvider.currentindex == 1
                  ? 'My Bookmarks'
                  : 'Account & Settings',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          // Tombol Dark Mode
          Icon(Icons.dark_mode_rounded),
          Switch(
            value: themeProvider.isDarkMode,
            onChanged: (val) => themeProvider.toggleTheme(val),
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
          ),

          // --- START NEW CODE ---
          // Tombol Reset Bookmark (Hanya muncul jika di halaman Bookmark dan ada bookmark)
          if (navigationProvider.currentindex == 1 &&
              bookmarkProvider.bookmarks.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all, color: Colors.red),
              tooltip: 'Clear All Bookmarks',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Clear All Bookmarks?'),
                      content: const Text(
                          'Are you sure you want to remove all bookmarks? This action cannot be undone.'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Clear All',
                              style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            bookmarkProvider
                                .clearAllBookmarks(); // Panggil fungsi reset dari BookmarkProvider
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('All bookmarks cleared!')),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          // --- END NEW CODE ---
        ],
      ),
      body: _pages[navigationProvider.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentindex,
        onTap: navigationProvider.setindex,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmarks"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account"),
        ],
      ),
    );
  }
}
