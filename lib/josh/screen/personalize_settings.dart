// lib/josh/screen/personalize_settings.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:praktek2/josh/Provider/Theme.dart';
import 'package:praktek2/josh/screen/edit_profile_page.dart'; // Import halaman baru

class PersonalizeSettings extends StatelessWidget {
  const PersonalizeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemePro>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Personalize Settings'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Settings', // Tambahkan kategori baru
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Edit Profile'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EditProfilePage()), // Navigasi ke halaman edit profil
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'App Theme',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: SwitchListTile(
                    title:
                        const Text('Dark Mode', style: TextStyle(fontSize: 16)),
                    secondary: const Icon(Icons.dark_mode_outlined),
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                    activeColor: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Other Personalization Options (Future)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const Icon(Icons.font_download),
                    title: const Text('Font Style'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Font Style settings coming soon!')),
                      );
                    },
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text('Language'),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Language settings coming soon!')),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
