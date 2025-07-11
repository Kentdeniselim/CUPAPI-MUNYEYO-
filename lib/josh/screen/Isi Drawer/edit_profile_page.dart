// lib/josh/screen/Isi Drawer/edit_profile_page.dart
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  Uint8List? _imageBytes;
  XFile? _imageXFile;
  double _blurValue = 0.0;
  // State untuk warna border RGB
  double _redValue = 0.0;
  double _greenValue = 0.0;
  double _blueValue = 0.0;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        _imageXFile = pickedFile;
        _imageBytes = imageBytes;
        _blurValue = 0.0;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada gambar yang dipilih.')),
      );
    }
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
            Stack(
              children: [
                // Lingkaran profil dengan blur
                ImageFiltered(
                  imageFilter:
                      ImageFilter.blur(sigmaX: _blurValue, sigmaY: _blurValue),
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: _imageBytes != null
                          ? MemoryImage(_imageBytes!)
                          : null,
                      child: _imageBytes == null
                          ? Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey.shade700,
                            )
                          : null,
                    ),
                  ),
                ),
                // Outline border di atas lingkaran profil
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Color.fromRGBO(
                              _redValue.toInt(),
                              _greenValue.toInt(),
                              _blueValue.toInt(),
                              1.0), // Warna border dinamis
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_imageBytes != null)
              Column(
                children: [
                  const Text('Tingkat Keburaman Foto'),
                  Slider(
                    value: _blurValue,
                    min: 0.0,
                    max: 10.0,
                    divisions: 100,
                    label: _blurValue.toStringAsFixed(1),
                    activeColor: Colors.green,
                    onChanged: (double value) {
                      setState(() {
                        _blurValue = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Outline Border Color'),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: _redValue,
                          min: 0,
                          max: 255,
                          label: 'R: ${_redValue.toInt()}',
                          activeColor: Colors.red,
                          onChanged: (double value) {
                            setState(() {
                              _redValue = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${_redValue.toInt()}',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: _greenValue,
                          min: 0,
                          max: 255,
                          label: 'G: ${_greenValue.toInt()}',
                          activeColor: Colors.green,
                          onChanged: (double value) {
                            setState(() {
                              _greenValue = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${_greenValue.toInt()}',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: _blueValue,
                          min: 0,
                          max: 255,
                          label: 'B: ${_blueValue.toInt()}',
                          activeColor: Colors.blue,
                          onChanged: (double value) {
                            setState(() {
                              _blueValue = value;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${_blueValue.toInt()}',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('Pilih Foto Profil'),
            ),
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
                foregroundColor: Colors.white,
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
