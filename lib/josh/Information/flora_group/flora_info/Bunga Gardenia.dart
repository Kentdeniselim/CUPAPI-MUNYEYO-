import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class BungaGardenia extends StatefulWidget {
  const BungaGardenia({super.key});

  @override
  _BungaGardeniaState createState() => _BungaGardeniaState();
}

class _BungaGardeniaState extends State<BungaGardenia> {
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
          "Bunga Gardenia",
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
                bookmarkProvider.isBookmarked("Bunga Gardenia");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Bunga Gardenia',
                  'image':
                      'https://live.staticflickr.com/5803/22583644456_c934c686f3_b.jpg',
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
                  'https://live.staticflickr.com/5803/22583644456_c934c686f3_b.jpg',
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
                            "Bunga Gardenia adalah salah satu bunga tropis yang terkenal karena keindahan dan aromanya yang khas. Tumbuhan ini berasal dari keluarga Rubiaceae dan sering ditemukan di berbagai wilayah dengan iklim hangat.",
                        style: TextStyle(fontSize: 15),
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
                      buildTextRow("Divisi", "Magnoliophyta"),
                      buildTextRow("Kelas", "Magnoliopsida"),
                      buildTextRow("Ordo", "Gentianales"),
                      buildTextRow("Famili", "Rubiaceae"),
                      buildTextRow("Genus", "Rubiaceae"),
                      buildTextRow("Spesies", "Gardenia jasminoides",
                          isItalic: true),
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
                            "Gardenia tersebar luas di berbagai negara beriklim tropis dan subtropis, terutama di Asia Timur, Asia Tenggara, Afrika, dan beberapa wilayah Pasifik. Tanaman ini juga banyak dibudidayakan di negara-negara seperti Cina, Jepang, India, dan Indonesia, serta di Amerika Serikat, khususnya di Florida dan California yang memiliki kondisi iklim serupa.",
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
                    "https://tse3.mm.bing.net/th?id=OIP.03HC2kx5stXdNd-P2_7f3QHaE6&pid=Api&P=0&h=220",
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
                            "Bunga Gardenia tumbuh subur di lingkungan yang hangat, lembap, dan memiliki tanah yang subur. Tanaman ini sering ditemukan di hutan tropis, semak belukar, serta tanah dengan kadar keasaman tinggi. Gardenia juga sering dijadikan tanaman hias di pekarangan rumah karena keindahannya.",
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
                      'Aroma',
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
                              "Salah satu keunggulan utama Gardenia adalah aromanya yang harum dan menenangkan. Wanginya sering digambarkan sebagai perpaduan antara melati dan vanila, dengan karakter yang manis dan lembut. Karena keharumannya yang khas, bunga ini sering digunakan dalam parfum, teh herbal, dan aromaterapi.",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
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
                              "Gardenia memiliki beberapa keunikan yang membuatnya istimewa. Bunga ini dikenal dengan aroma yang sangat harum dan tahan lama, menjadikannya salah satu bunga dengan wangi paling kuat. Warna putih bersihnya melambangkan kesucian dan ketenangan, sehingga sering digunakan dalam dekorasi pernikahan. Selain itu, Gardenia merupakan tanaman hias populer yang sering ditanam di pekarangan atau sebagai tanaman pot karena tampilannya yang elegan. Bunga ini juga memiliki manfaat kesehatan, di mana ekstraknya digunakan dalam pengobatan tradisional sebagai antiinflamasi, pereda stres, dan bahan alami dalam produk kecantikan. Keindahan dan manfaatnya menjadikan Gardenia salah satu bunga yang paling dihargai di dunia.",
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
