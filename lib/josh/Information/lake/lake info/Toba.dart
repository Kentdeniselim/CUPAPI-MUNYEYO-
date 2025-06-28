import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Toba extends StatefulWidget {
  const Toba({super.key});

  @override
  _danautoba createState() => _danautoba();
}

class _danautoba extends State<Toba> {
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
          "Danau Toba",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Danau Toba");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Danau Toba',
                  'image':
                      'https://asset.kompas.com/crops/PZkNa1XEcC9huIv3Gd1tHebvzIA=/0x0:780x520/1200x800/data/photo/2023/07/25/64bf6a78dfe73.jpg',
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
                  'https://asset.kompas.com/crops/PZkNa1XEcC9huIv3Gd1tHebvzIA=/0x0:780x520/1200x800/data/photo/2023/07/25/64bf6a78dfe73.jpg',
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
                            "Danau Toba adalah danau vulkanik terbesar di Indonesia dan salah satu yang terbesar di dunia. Terletak di Sumatera Utara, danau ini memiliki panjang sekitar 100 km dan lebar 30 km, dengan kedalaman mencapai lebih dari 500 meter. Danau ini terbentuk dari letusan supervolcano sekitar 74.000 tahun yang lalu, yang merupakan salah satu letusan terbesar dalam sejarah bumi. Di tengah Danau Toba terdapat Pulau Samosir, sebuah pulau vulkanik yang juga menjadi pusat budaya suku Batak. Selain keindahannya, Danau Toba memiliki peran penting dalam ekosistem dan ekonomi masyarakat sekitarnya, termasuk sebagai sumber air, tempat perikanan, serta destinasi wisata utama di Indonesia.",
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
                      buildTextRow("Luas", "1.130 km²"),
                      buildTextRow("Kedalaman", "505 M"),
                      buildTextRow("Provinsi", "Sumatera Utara"),
                      buildTextRow(
                        "Ikan",
                        "Ikan Nilem, Ikan Mujahir, Ikan Nila, Ikan Red Devil, Ikan Louhan, Ikan Kaca",
                      ),
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
                      'Kedalaman',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Danau Toba memiliki kedalaman maksimum sekitar 505 meter, menjadikannya danau terdalam di Indonesia dan salah satu yang terdalam di dunia. Kedalaman ini menunjukkan bahwa Danau Toba adalah sisa dari letusan supervolcano yang membentuk kaldera besar, yang kemudian terisi air selama ribuan tahun. Kondisi ini juga berkontribusi pada ekosistem unik di dalam danau serta suhu air yang cenderung lebih stabil di kedalaman tertentu.",
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
                      'Lokasi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Danau Toba terletak di Provinsi Sumatera Utara, Indonesia, mencakup beberapa kabupaten seperti Samosir, Toba, Humbang Hasundutan, dan Karo. Danau ini berada di ketinggian sekitar 905 meter di atas permukaan laut, menjadikannya salah satu danau kaldera terbesar di dunia. Di tengahnya terdapat Pulau Samosir, yang menambah daya tarik wisata dan budaya di kawasan ini.",
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
                      'Asal usul',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Danau Toba terbentuk akibat letusan dahsyat gunung berapi super sekitar 74.000 tahun yang lalu. Letusan ini menjadi salah satu letusan vulkanik terbesar dalam sejarah Bumi, menyebabkan perubahan iklim global dan membentuk kaldera raksasa yang kemudian terisi air, menciptakan Danau Toba. Pulau Samosir, yang terletak di tengah danau, juga merupakan hasil dari aktivitas vulkanik yang sama.",
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
                      'Fungsi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Danau Toba memiliki berbagai fungsi yang penting, baik secara ekologis, ekonomi, maupun sosial. Secara ekologis, danau ini menjadi habitat bagi berbagai spesies ikan dan ekosistem air tawar yang unik. Dari sisi ekonomi, Danau Toba menjadi sumber mata pencaharian bagi masyarakat sekitar melalui perikanan, pertanian, dan terutama sektor pariwisata. Selain itu, danau ini juga berfungsi sebagai sumber air bagi masyarakat setempat serta memainkan peran dalam menjaga keseimbangan lingkungan. Secara sosial dan budaya, Danau Toba memiliki nilai sejarah dan merupakan bagian penting dari kehidupan suku Batak.",
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
