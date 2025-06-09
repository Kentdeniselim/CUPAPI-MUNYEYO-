import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class Edelweiss extends StatefulWidget {
  const Edelweiss({super.key});

  @override
  _edelweiss createState() => _edelweiss();
}

class _edelweiss extends State<Edelweiss> {
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
          "Bunga Edelweiss Javanica",
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
                bookmarkProvider.isBookmarked("Bunga Edelweiss");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Bunga Edelweiss',
                  'image':
                      'https://tse2.mm.bing.net/th/id/OIP.YsDWuZi7YdBuAZEKZbavSwHaFj?w=355&h=355&c=7',
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
                MaterialPageRoute(builder: (context) => MainNavigation()),
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
                  'https://tse2.mm.bing.net/th/id/OIP.YsDWuZi7YdBuAZEKZbavSwHaFj?w=355&h=355&c=7',
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
                            "Anaphalis javanica, yang dikenal sebagai Edelweiss jawa (Javanese edelweiss) atau Bunga Senduro, adalah tumbuhan endemik zona alpina/montana di berbagai pegunungan tinggi di Indonesia yang saat ini dikategorikan sebagai tumbuhan langka. Tumbuhan ini dapat mencapai ketinggian 8 meter dan dapat memiliki batang sebesar kaki manusia, walaupun pada umumnya tidak melebihi 1 meter.Edelweiss berkembang biak dengan cara generatif. Dengan serbuk-serbuk bunga yang ringan, maka mudah terbawa oleh angin.",
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
                      SizedBox(height: 10),
                      buildTextRow("Kerajaan", "Plantae"),
                      buildTextRow("Ordo", "Asterales"),
                      buildTextRow("Family", "Asteraceae"),
                      buildTextRow("Genus", "Anaphalis"),
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
                            "Persebaran bunga Edelweiss Jawa (Anaphalis javanica) terbatas di kawasan pegunungan tinggi di Indonesia, khususnya di Pulau Jawa dan sebagian wilayah di Bali dan Lombok. Bunga ini tumbuh secara alami di ketinggian lebih dari 2.000 meter di atas permukaan laut, terutama di lereng-lereng gunung berapi seperti Gunung Gede, Gunung Pangrango, Gunung Semeru, Gunung Lawu, dan Gunung Rinjani. Karena hidup di zona subalpin, Edelweiss Jawa sangat tergantung pada suhu dingin, paparan sinar matahari langsung, dan tanah vulkanik yang gembur. Meskipun tersebar di beberapa gunung, populasi Edelweiss tidak merata dan cenderung hanya ditemukan di area tertentu yang memiliki kondisi lingkungan yang sesuai. Keindahan dan kelangkaannya menjadikan Edelweiss Jawa sebagai simbol keabadian dan bunga khas pegunungan tropis Indonesia, meskipun kini keberadaannya mulai terancam akibat pengambilan liar dan tekanan dari aktivitas wisata.",
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
                            "Habitat bunga Edelweiss Jawa (Anaphalis javanica) berada di kawasan pegunungan tinggi dengan iklim dingin dan kering, biasanya pada ketinggian di atas 2.000 meter di atas permukaan laut. Tumbuhan ini tumbuh subur di zona subalpin yang memiliki suhu rendah, intensitas sinar matahari tinggi, dan tanah vulkanik yang kaya akan mineral namun miskin unsur hara. Edelweiss Jawa biasanya ditemukan di padang rumput pegunungan, lereng-lereng terbuka, atau di sekitar kawah dan puncak gunung, tempat di mana persaingan dengan tanaman lain sangat minim. Keistimewaan habitat ini membuat Edelweiss mampu beradaptasi dengan kondisi ekstrem dan memiliki daya tahan tinggi terhadap sinar ultraviolet dan angin kencang. Karena habitatnya yang khusus dan sulit dijangkau, Edelweiss Jawa tidak mudah tumbuh di tempat lain, sehingga menjadikannya salah satu bunga langka yang hanya bisa ditemukan di pegunungan tertentu di Indonesia.",
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
                      'Ancaman Kepunahan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Bunga Edelweiss Jawa (Anaphalis javanica) menghadapi ancaman kepunahan yang signifikan akibat berbagai faktor, terutama karena eksploitasi berlebihan dan kerusakan habitat. Pengambilan bunga Edelweiss secara liar untuk dijadikan koleksi, oleh-oleh wisatawan, atau digunakan dalam upacara adat, telah menyebabkan penurunan jumlah populasi bunga ini di alam. Selain itu, perubahan iklim yang menyebabkan peningkatan suhu dan perubahan pola curah hujan turut mengancam kelangsungan hidup tanaman ini, karena Edelweiss hanya dapat tumbuh di daerah dengan suhu dingin dan kondisi khusus. Aktivitas manusia seperti pembangunan infrastruktur, pembukaan lahan untuk pertanian, dan pariwisata yang tidak terkelola dengan baik juga semakin mengurangi luas habitat alami bunga Edelweiss Jawa. Tanpa langkah konservasi yang tepat, bunga yang menjadi simbol keindahan pegunungan Indonesia ini berisiko mengalami kepunahan dalam waktu dekat.",
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
                      'Keunikan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Keunikan bunga Edelweiss Jawa (Anaphalis javanica) terletak pada kemampuannya bertahan hidup di kondisi ekstrem pegunungan tinggi dengan suhu yang dingin dan udara yang tipis. Bunga ini memiliki kelopak putih kekuningan yang berbentuk seperti bintang dan dikelilingi oleh daun-daun kecil berbulu halus, yang memberikannya penampilan yang khas dan tahan lama. Edelweiss Jawa juga dikenal sebagai bunga yang memiliki daya tahan luar biasa terhadap sinar ultraviolet, angin kencang, dan suhu ekstrem, yang membuatnya tetap mekar meski dalam kondisi lingkungan yang sulit. Bunga ini sering dianggap sebagai simbol keabadian dan ketahanan, karena meskipun terancam punah, ia tetap menjadi salah satu bunga paling ikonik di pegunungan tropis Indonesia. Selain keindahan visualnya, Edelweiss juga memiliki makna budaya yang mendalam bagi masyarakat lokal, menjadikannya bunga yang tak hanya unik secara biologis, tetapi juga memiliki nilai filosofis yang tinggi.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
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
