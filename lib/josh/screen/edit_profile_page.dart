// lib/josh/screen/edit_profile_page.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Untuk File

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _imageFile; // Menyimpan file gambar yang dipilih

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tidak ada gambar yang dipilih.')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey[300],
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!) as ImageProvider<Object>?
                    : const NetworkImage('https://via.placeholder.com/150'), // Placeholder default
                child: _imageFile == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.grey[700],
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
              ),
              child: const Text('Pilih Foto Profil'),
            ),
            const SizedBox(height: 20),
            // Anda bisa menambahkan TextField untuk mengedit nama pengguna, email, dll.
            // TextField(
            //   decoration: InputDecoration(labelText: 'Nama Pengguna'),
            // ),
            // SizedBox(height: 10),
            // TextField(
            //   decoration: InputDecoration(labelText: 'Email'),
            // ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan profil
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil berhasil diperbarui!')),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}