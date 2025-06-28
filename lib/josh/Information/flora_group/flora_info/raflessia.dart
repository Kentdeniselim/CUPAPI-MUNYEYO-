import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Raflessia extends StatefulWidget {
  const Raflessia({super.key});

  @override
  _RaflessiaState createState() => _RaflessiaState();
}

class _RaflessiaState extends State<Raflessia> {
  final List<String> comments = [];
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  void _deleteComment(int index) {
    setState(() {
      comments.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rafflesia arnoldii",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked =
                bookmarkProvider.isBookmarked("Bunga Raflessia");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Bunga Raflessia',
                  'image':
                      'https://c1.staticflickr.com/7/6054/6265508839_e674f9dc5c_b.jpg',
                });
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
            );
          }),
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Kembali ke Home',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainNavigationpro()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  'https://c1.staticflickr.com/7/6054/6265508839_e674f9dc5c_b.jpg',
                  height: 300,
                  width: 600,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengenalan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sebagian besar tanaman dalam genus parasit Rafflesia yang berisi bunga terbesar di dunia—mungkin berisiko punah, menurut penelitian baru.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sering disebut bunga bangkai atau bunga lili bangkai yang bau, bunga ini terkenal karena bau khasnya yang seperti daging busuk. Meskipun genusnya tidak mencakup bunga bangkai yang disebut titan arum , yang dikenal menarik banyak orang ke kebun raya  saat mekar setiap beberapa tahun, tanaman Rafflesia memiliki bunga yang berumur pendek dan berbau tengik.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Taksonomi",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      buildTextRow("Kingdom", "Plantae"),
                      buildTextRow("clade", "Tracheophytes"),
                      buildTextRow("clade", "Angiosperms"),
                      buildTextRow("clade", "Eudicots"),
                      buildTextRow("clade", "Rosids"),
                      buildTextRow("Orde", "Malpighiales"),
                      buildTextRow("Family", "Rafflesiaceae", isItalic: true),
                      buildTextRow("Genus", "Rafflesia", isItalic: true),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Persebaran',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Bunga Rafflesia arnoldii banyak ditemukan di hutan hujan tropis Sumatra dan Kalimantan",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                      child: Image.network(
                    "https://tse2.mm.bing.net/th?id=OIP.2PsuU7mBy3DUjhym4INDQAHaE8&pid=Api&P=0&h=220",
                    width: 800,
                    height: 300,
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Habitat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Habitat Rafflesia arnoldii adalah hutan hujan tropis di Sumatra dan Kalimantan, tumbuh sebagai parasit pada akar Tetrastigma di lingkungan lembab, teduh, dan berkanopi rapat.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ancaman kepunahan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Rafflesia arnoldii menghadapi ancaman kepunahan akibat kerusakan habitat karena deforestasi, konversi lahan, dan aktivitas manusia seperti pertanian serta pembangunan. Selain itu, siklus hidupnya yang kompleks, ketergantungan pada inang tertentu (Tetrastigma), serta tingkat reproduksi yang rendah membuatnya semakin rentan. Perburuan dan pengambilan bunga secara ilegal juga mempercepat penurunan populasinya di alam.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Keunikan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    Align(
                      alignment:
                          Alignment.centerLeft, // Pastikan teks rata kiri
                      child: Text.rich(
                        TextSpan(
                          text:
                              "Rafflesia arnoldii memiliki beberapa keunikan luar biasa. Bunga ini dikenal sebagai bunga terbesar di dunia, dengan diameter mencapai satu meter dan berat hingga 11 kilogram. Tidak seperti tumbuhan pada umumnya, Rafflesia tidak memiliki batang, daun, atau akar, melainkan hidup sebagai parasit pada tanaman inangnya, terutama Tetrastigma. Keunikan lainnya adalah bau busuk menyengat yang dikeluarkannya, menyerupai bau bangkai, yang berfungsi untuk menarik lalat sebagai agen penyerbukannya. Selain itu, bunga ini memiliki siklus hidup yang panjang dan rumit, dengan masa mekar yang sangat singkat, sekitar 5–7 hari sebelum akhirnya layu.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: "Tambahkan komentar...",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send, color: Colors.green),
                    onPressed: _addComment,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comments.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(comments[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteComment(index),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextRow(String label, String value, {bool isItalic = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text.rich(
        TextSpan(
          text: "$label : ",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: " $value",
              style: TextStyle(
                fontSize: 18,
                fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
