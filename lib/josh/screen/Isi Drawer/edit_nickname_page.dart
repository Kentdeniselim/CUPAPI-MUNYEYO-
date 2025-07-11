import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:praktek2/josh/Provider/user_provider.dart';

class ChangeNicknamePage extends StatefulWidget {
  const ChangeNicknamePage({Key? key}) : super(key: key);

  @override
  State<ChangeNicknamePage> createState() => _ChangeNicknamePageState();
}

class _ChangeNicknamePageState extends State<ChangeNicknamePage> {
  final TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ganti Nama Panggilan'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nicknameController,
              decoration: const InputDecoration(
                labelText: 'Nama Panggilan Baru',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_nicknameController.text.isNotEmpty) {
                  // Panggil provider untuk mengubah nama panggilan
                  Provider.of<UserProvider>(context, listen: false)
                      .changeNickname(_nicknameController.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Nama panggilan berhasil diperbarui!')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Nama panggilan tidak boleh kosong!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}