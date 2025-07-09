// lib/josh/Information/article_detail_page.dart

import 'package:flutter/material.dart';
import 'package:praktek2/josh/screen/navigation.dart'; // Impor halaman navigasi
import 'package:provider/provider.dart';
import '../Provider/Bookmarkpro.dart';

class ArticleDetailPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String content;

  const ArticleDetailPage({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.content,
  }) : super(key: key);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    final bookmarkProvider = Provider.of<BookmarkProvider>(context);
    final isBookmarked = bookmarkProvider.isBookmarked(widget.title);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
        actions: [
          // Tombol Bookmark
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.yellow,
            ),
            tooltip: 'Bookmark',
            onPressed: () {
              final item = {
                'title': widget.title,
                'image': widget.imageUrl,
              };
              bookmarkProvider.toggleBookmark(item);
              final snackBar = SnackBar(
                content: Text(
                  isBookmarked
                      ? 'Dihapus dari Bookmark'
                      : 'Ditambahkan ke Bookmark',
                ),
                duration: Duration(seconds: 1),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),

          // --- TOMBOL KEMBALI KE HOME YANG DITAMBAHKAN ---
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke Home',
            onPressed: () {
              // Menggunakan pushAndRemoveUntil agar tidak menumpuk halaman
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MainNavigationpro()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          // --- AKHIR BAGIAN YANG DITAMBAHKAN ---
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.image_not_supported,
                          size: 250, color: Colors.grey);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Divider(),
              const SizedBox(height: 10),
              Text(
                widget.content,
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
