// lib/josh/screen/bookmarkpage.dart
import 'package:flutter/material.dart';
import 'package:praktek2/josh/Information/Fauna_group/fauna%20info/elang%20jawa.dart';
import 'package:praktek2/josh/Information/Fauna_group/fauna%20info/harimau.dart';
import 'package:praktek2/josh/Information/Fauna_group/fauna%20info/jalakbali.dart';
import 'package:praktek2/josh/Information/Fauna_group/fauna%20info/komodo.dart';
import 'package:praktek2/josh/Information/Fauna_group/fauna%20info/penyu.dart';
import 'package:praktek2/josh/Information/flora_group/flora_info/Bunga%20Gardenia.dart';
import 'package:praktek2/josh/Information/flora_group/flora_info/anggrekhitam.dart';
import 'package:praktek2/josh/Information/flora_group/flora_info/edelweiss.dart';
import 'package:praktek2/josh/Information/flora_group/flora_info/michelia.dart';
import 'package:praktek2/josh/Information/flora_group/flora_info/raflessia.dart';
import 'package:praktek2/josh/Information/lake/lake%20info/Toba.dart';
import 'package:praktek2/josh/Information/lake/lake%20info/poso.dart';
import 'package:praktek2/josh/Information/lake/lake%20info/tempe.dart';
import 'package:praktek2/josh/Information/lake/lake%20info/towuti.dart';
import 'package:praktek2/josh/Information/mountain/mountain%20info/kerinci.dart';
import 'package:praktek2/josh/Information/mountain/mountain%20info/puncakjaya.dart';
import 'package:praktek2/josh/Information/mountain/mountain%20info/rinjani.dart';
import 'package:praktek2/josh/Information/mountain/mountain%20info/semeru.dart';
import 'package:praktek2/josh/Information/river/isi/barito.dart';
import 'package:praktek2/josh/Information/river/isi/batanghari.dart';
import 'package:praktek2/josh/Information/river/isi/kapuas.dart';
import 'package:praktek2/josh/Information/river/isi/mahakam.dart';
import 'package:provider/provider.dart';
import '../Provider/Bookmarkpro.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  // Helper function untuk buka halaman berdasarkan judul
  Widget? getDetailPageByTitle(String title) {
    switch (title) {
      case 'Komodo':
        return Komodo();
      case 'Jalak Bali':
        return JalakBali();
      case 'Elang Jawa':
        return Elangjawa();
      case 'Penyu':
        return Penyu();
      case 'Harimau Sumatera':
        return Harimausumatera();
      //flora
      case 'Anggrek Hitam':
        return AnggrekHitam();
      case 'Bunga Gardenia':
        return BungaGardenia();
      case 'Bunga Edelweiss':
        return Edelweiss();
      case 'Bunga Michellia':
        return Michelia();
      case 'Bunga Raflessia':
        return Raflessia();
      //lake
      case 'Danau Poso':
        return Poso();
      case 'Danau Tempe':
        return Tempe();
      case 'Danau Toba':
        return Toba();
      case 'Danau Towuti':
        return Towuti();
      //Mountain
      case 'Gunung Kerinci':
        return Kerinci();
      case 'Gunung Puncakjaya':
        return Puncakjaya();
      case 'Gunung Rinjani':
        return Rinjani();
      case 'Gunung Semeru':
        return Semeru();
      //River
      case 'Sungai Barito':
        return Barito();
      case 'Sungai Batanghari':
        return BatangHari();
      case 'Sungai Kapuas':
        return Kapuas();
      case 'Sungai Mahakam':
        return Mahakam();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookmarks = Provider.of<BookmarkProvider>(context).bookmarks;

    return Scaffold(
      body: bookmarks.isEmpty
          ? Center(child: Text('Belum ada bookmark'))
          : ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final item = bookmarks[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          item['image'] ?? '',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'] ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                item['description'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      final page = getDetailPageByTitle(
                                          item['title'] ?? '');
                                      if (page != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => page),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Halaman untuk ${item['title']} belum tersedia'),
                                          ),
                                        );
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 8),
                                    ),
                                    child: Icon(Icons.exit_to_app, size: 18),
                                  ),
                                  SizedBox(width: 8),
                                  IconButton(
                                    icon: Icon(Icons.delete,
                                        color: Colors.red, size: 20),
                                    onPressed: () {
                                      Provider.of<BookmarkProvider>(context,
                                              listen: false)
                                          .toggleBookmark(item);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
