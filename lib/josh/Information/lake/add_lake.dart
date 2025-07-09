import 'package:flutter/material.dart';
import 'package:praktek2/josh/Information/artikel_detail.dart';
import 'package:provider/provider.dart';
import '../../Provider/infomation provider/prolake.dart';

class AddLakePage extends StatefulWidget {
  @override
  _AddLakePageState createState() => _AddLakePageState();
}

class _AddLakePageState extends State<AddLakePage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _imageController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Artikel Danau'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Danau',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageController,
                decoration: InputDecoration(
                  labelText: 'URL Gambar',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'URL Gambar tidak boleh kosong';
                  }
                  if (!Uri.tryParse(value)!.hasAbsolutePath ?? true) {
                    return 'Masukkan URL yang valid';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Isi Artikel',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                maxLines: 10,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isi artikel tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newLake = {
                      'nama': _namaController.text,
                      'image': _imageController.text,
                      'placeholder': 'assets/logo.png',
                      'page': ArticleDetailPage(
                        title: _namaController.text,
                        imageUrl: _imageController.text,
                        content: _contentController.text,
                      ),
                    };
                    context.read<Prolake>().tambahlake(newLake);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Artikel "${_namaController.text}" berhasil ditambahkan!')),
                    );
                  }
                },
                child: Text('Simpan Artikel'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
