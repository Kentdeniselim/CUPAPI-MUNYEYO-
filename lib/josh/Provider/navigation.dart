import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Theme.dart';
import 'package:praktek2/josh/Provider/navpro.dart';
import 'package:praktek2/josh/screen/Home.dart';
import 'package:praktek2/josh/screen/acc.dart';
import 'package:praktek2/josh/screen/bookmarkpage.dart';
import 'package:provider/provider.dart';

// Provider untuk navigasi
class MainNavigationProvider with ChangeNotifier {
  int _currentindex = 0;

  int get currentindex => _currentindex;

  void setindex(int index) {
    _currentindex = index;
    notifyListeners();
  }
}

// Provider untuk theme
class ThemeProvider with ChangeNotifier {
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
    BookmarkPage(),
    const Account(),
  ];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<Navpro>(context);
    final tema = Provider.of<ThemePro>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RimbaFamily',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
        actions: [
          Icon(Icons.dark_mode_rounded),
          Switch(
            value: tema.isDarkMode,
            onChanged: (val) => tema.toggleTheme(val),
            activeColor: Colors.white,
            activeTrackColor: Colors.black,
          ),
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
