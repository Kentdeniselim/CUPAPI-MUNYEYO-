import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Penyu extends StatefulWidget {
  const Penyu({super.key});

  @override
  _penyu createState() => _penyu();
}

class _penyu extends State<Penyu> {
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
        title: Text("Penyu", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Penyu");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Penyu',
                  'image':
                      'https://1.bp.blogspot.com/-rgGPGu5-wL0/X6JcDPOTl3I/AAAAAAAAFCc/kXpnCuctUFgpL3eLfWYy4jYoe_MOR8dTgCLcBGAsYHQ/s1168/gambar%2Bpenyu%2Bhijau-2.jpg',
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
                  'https://1.bp.blogspot.com/-rgGPGu5-wL0/X6JcDPOTl3I/AAAAAAAAFCc/kXpnCuctUFgpL3eLfWYy4jYoe_MOR8dTgCLcBGAsYHQ/s1168/gambar%2Bpenyu%2Bhijau-2.jpg',
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
                            "Penyu atau katung adalah kura-kura laut yang ditemukan di semua samudra di dunia. Penyu sudah ada sejak akhir zaman Kapur atau seusia dengan dinosaurus. Fosil penyu tertua setidaknya berumur 120 juta tahun. Fosil itu menunjukkan semua ciri khas penyu modern.Archelon, yang berukuran panjang badan 4,5 meter, 75-65 juta tahun lalu telah berenang di laut purba seperti penyu masa kini.",
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
                      buildTextRow("Kerajaan", "Animalia"),
                      buildTextRow("Ordo", "Testudines"),
                      buildTextRow("Kelas", "Reptilia"),
                      buildTextRow("Super Family", "Chelonioidea"),
                      buildTextRow("Subordo", "Cryptodira"),
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
                      'Status Kelangkaan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Penyu merupakan salah satu spesies yang kini berada dalam kondisi terancam punah. Dari tujuh spesies penyu yang dikenal di dunia, sebagian besar telah masuk dalam daftar merah IUCN (International Union for Conservation of Nature) dengan status mulai dari **rentan (vulnerable)** hingga **kritis (critically endangered)**. Ancaman utama yang menyebabkan kelangkaan penyu meliputi perburuan ilegal, perusakan habitat pesisir, pencemaran laut, serta tersangkutnya penyu pada alat tangkap nelayan. Selain itu, perubahan iklim juga memengaruhi suhu pasir tempat penyu bertelur, yang dapat berdampak pada rasio jenis kelamin tukik (anak penyu). Upaya konservasi dan perlindungan penyu saat ini menjadi sangat penting untuk mencegah kepunahan spesies-spesies tersebut di masa depan.",
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
                            "Habitat penyu tersebar luas di berbagai wilayah perairan tropis dan subtropis di seluruh dunia. Penyu laut biasanya hidup di laut lepas, perairan pesisir, dan terumbu karang, namun mereka akan kembali ke daratan—khususnya pantai tempat mereka menetas—untuk bertelur. Beberapa spesies penyu, seperti penyu hijau dan penyu sisik, lebih sering ditemukan di perairan dangkal yang kaya akan lamun dan terumbu karang, karena tempat tersebut menyediakan makanan yang melimpah. Sementara itu, penyu belimbing cenderung menjelajah perairan yang lebih dalam dan luas. Pantai-pantai berpasir yang tenang dan tidak terganggu sangat penting bagi penyu betina untuk bertelur. Sayangnya, banyak habitat penyu saat ini terancam oleh aktivitas manusia, seperti pembangunan pesisir, polusi, serta perubahan iklim yang mengakibatkan naiknya permukaan air laut dan merusak daerah bertelur alami mereka.",
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
                      'Makanan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Makanan penyu sangat bervariasi tergantung pada spesiesnya, usia, dan lingkungan tempat mereka hidup. Penyu hijau, misalnya, cenderung herbivora saat dewasa dan mengonsumsi tumbuhan laut seperti lamun dan alga. Sebaliknya, penyu sisik lebih menyukai spons laut, sementara penyu lekang dan penyu tempayan memakan hewan laut seperti ubur-ubur, kepiting, kerang, dan berbagai jenis invertebrata laut lainnya. Penyu belimbing dikenal sebagai pemakan ubur-ubur utama dan dapat menjelajah jauh untuk mencari mangsanya. Tukik atau anak penyu biasanya bersifat omnivora dan memakan plankton, larva, serta sisa-sisa organisme kecil di perairan dangkal. Keanekaragaman makanan penyu menunjukkan pentingnya kelestarian ekosistem laut, karena perubahan pada rantai makanan atau pencemaran dapat berdampak langsung terhadap kelangsungan hidup spesies penyu di alam liar.",
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
                            "Penyu menghadapi berbagai ancaman yang serius dan kompleks yang dapat menyebabkan kepunahan jika tidak segera ditangani. Salah satu ancaman terbesar adalah perburuan ilegal, baik untuk diambil daging, telur, maupun cangkangnya yang bernilai tinggi di pasar gelap. Selain itu, kerusakan habitat, terutama di wilayah pesisir tempat penyu bertelur, akibat pembangunan, pariwisata, dan polusi, turut mempersempit ruang hidup mereka. Perubahan iklim juga memberikan dampak signifikan, seperti naiknya permukaan laut yang mengikis pantai-pantai peneluran dan perubahan suhu pasir yang memengaruhi jenis kelamin tukik. Di laut, penyu sering kali tersangkut dalam alat tangkap nelayan, seperti jaring atau long line, yang menyebabkan kematian tidak sengaja. Tak kalah berbahaya, sampah plastik di laut, terutama kantong plastik yang menyerupai ubur-ubur, sering dikira makanan oleh penyu dan dapat menyebabkan kematian setelah tertelan. Semua faktor ini saling berkaitan dan mempercepat penurunan populasi penyu secara global, sehingga upaya konservasi yang serius dan berkelanjutan sangat dibutuhkan.",
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
