// lib/josh/Information/Fauna_group/Fauna.dart

import 'package:flutter/material.dart';
import 'package:praktek2/josh/Information/Fauna_group/add_fauna.dart';
import 'package:provider/provider.dart';
import '../../Provider/infomation provider/profauna.dart';
import '../../Provider/kategori.dart';

class Faunapage extends StatelessWidget {
  const Faunapage({super.key});

  @override
  Widget build(BuildContext context) {
    final hewanList = context.watch<Prohewan>().hewanTersaring;
    final kategoriTerpilih = context.watch<Prohewan>().kategoriTerpilih;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FAUNA",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: TextField(
              onChanged: (query) =>
                  context.read<Prohewan>().setSearchQuery(query),
              decoration: InputDecoration(
                labelText: 'Search Animals......',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioKategori(
                  value: 'semua',
                  groupValue: kategoriTerpilih,
                  onChanged: (v) => context.read<Prohewan>().setKategori(v!),
                ),
                RadioKategori(
                  value: 'darat',
                  groupValue: kategoriTerpilih,
                  onChanged: (v) => context.read<Prohewan>().setKategori(v!),
                ),
                RadioKategori(
                  value: 'udara',
                  groupValue: kategoriTerpilih,
                  onChanged: (v) => context.read<Prohewan>().setKategori(v!),
                ),
                RadioKategori(
                  value: 'air',
                  groupValue: kategoriTerpilih,
                  onChanged: (v) => context.read<Prohewan>().setKategori(v!),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: hewanList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                mainAxisExtent: 350,
              ),
              itemBuilder: (context, index) {
                final h = hewanList[index];
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            h['nama'],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            placeholder: h['placeholder'],
                            image: h['image'],
                            width: double.infinity,
                            height: 210,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => h['page']),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 18),
                              backgroundColor: Colors.green,
                            ),
                            child: const Text(
                              "More Info",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddFaunaPage()),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}
