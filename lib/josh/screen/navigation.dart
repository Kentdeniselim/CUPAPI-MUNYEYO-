import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Theme.dart';
import 'package:praktek2/josh/Provider/time_provider.dart';
import 'package:praktek2/josh/Provider/navpro.dart';
import 'package:praktek2/josh/screen/About_Us.dart';
import 'package:praktek2/josh/screen/Home.dart';
import 'package:praktek2/josh/screen/bookmarkpage.dart';
import 'package:praktek2/josh/screen/personalize_settings.dart';
import 'package:praktek2/josh/screen/login.dart';
import 'package:provider/provider.dart';
import '../Provider/Bookmarkpro.dart';

class MainNavigationpro extends StatelessWidget {
  MainNavigationpro({Key? key}) : super(key: key);

  final List<Widget> _pages = [
    const Home(),
    BookmarkPage(),
  ];

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'RimbaFamily';
      case 1:
        return 'My Bookmarks';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<Navpro>(context);
    final themeProvider = Provider.of<ThemePro>(context);
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final timeProvider = Provider.of<TimeProvider>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1601758123927-1960c337cd29?auto=format&fit=crop&w=80&q=80',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cupapi Munyenyo',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    'CupapiMunyenyo@Mikroskil.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalizeSettings(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _getTitle(navigationProvider.currentindex),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              timeProvider.currentTime,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          if (navigationProvider.currentindex == 1 &&
              bookmarkProvider.bookmarks.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep, color: Colors.red),
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
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: const Text('Clear All',
                              style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            bookmarkProvider.clearAllBookmarks();
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
        ],
      ),
      backgroundColor: Colors.green,
      body: _pages[navigationProvider.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.currentindex,
        onTap: navigationProvider.setindex,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmarks"),
        ],
      ),
    );
  }
}
