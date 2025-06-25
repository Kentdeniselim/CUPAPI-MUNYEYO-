import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Theme.dart'; // Pastikan import ini ada
import 'package:provider/provider.dart';
import 'package:praktek2/josh/screen/personalize_settings.dart'; // Import halaman personalisasi baru

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemePro>(context); // Akses ThemePro

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian Profil (Contoh)
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Ganti dengan gambar profil jika ada
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Nama Pengguna', // Ganti dengan nama pengguna
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'email@example.com', // Ganti dengan email pengguna
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),

            Divider(),
            SizedBox(height: 20),

            // Opsi Akun
            Text(
              'Account Options',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Profile'),
                onTap: () {
                  // TODO: Implementasi halaman edit profil
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Edit Profile Pressed')),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  // TODO: Implementasi halaman ganti password
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Change Password Pressed')),
                  );
                },
              ),
            ),

            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 20),

            // Opsi Personalisasi
            Text(
              'Personalization',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Theme Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigasi ke halaman pengaturan personalisasi
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PersonalizeSettings()),
                  );
                },
              ),
            ),
            // Anda bisa menambahkan lebih banyak opsi personalisasi di sini

            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 20),

            // Opsi Lainnya (Contoh)
            Text(
              'Other',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text('About Us'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('About Us Pressed')),
                  );
                },
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.red),
                title: Text('Logout'),
                textColor: Colors.red,
                onTap: () {
                  // TODO: Implementasi logika logout
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Logout Pressed')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
