import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class Poso extends StatefulWidget {
  const Poso({super.key});

  @override
  _danauposo createState() => _danauposo();
}

class _danauposo extends State<Poso> {
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
          "Danau Poso",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Danau Poso");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Danau Poso',
                  'image':
                      'https://tse1.mm.bing.net/th?id=OIP.nILnrFHD1eFCuKdWnzZ2VwHaEj&w=291&h=291&c=7',
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
                  'https://tse1.mm.bing.net/th?id=OIP.nILnrFHD1eFCuKdWnzZ2VwHaEj&w=291&h=291&c=7',
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
                            "Danau Poso adalah danau terbesar ketiga di Indonesia setelah Danau Toba dan Danau Singkarak. Danau ini terletak di Kabupaten Poso, Sulawesi Tengah dan memiliki kedalaman hingga 450 meter. Luasnya mencapai 32.000 hektar. Danau Poso juga dikenal dengan pasirnya yang berwarna kuning keemasan. ",
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
                      buildTextRow("Luas", "323,2 km²"),
                      buildTextRow("Kedalaman", "450 m M"),
                      buildTextRow("Provinsi", "Sulawesi Tengah"),
                      buildTextRow("Ikan", "Ikan Sidat, Ikan Gobi, Ikan Rono"),
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
                            "Danau Poso, yang terletak di Provinsi Sulawesi Tengah, memiliki kedalaman yang cukup luar biasa. Dengan kedalaman mencapai sekitar **510 meter**, Danau Poso merupakan salah satu danau terdalam di Indonesia, bahkan tercatat sebagai danau terdalam ketiga di Asia Tenggara. Kedalaman ini memberi karakteristik khas pada danau ini, termasuk ekosistem perairan yang mendalam dan variasi suhu yang signifikan antara permukaan dan dasar danau. Keunikan kedalaman Danau Poso juga memberikan kondisi yang ideal bagi berbagai jenis spesies ikan endemik yang hanya bisa ditemukan di danau ini, serta menjadikannya sebagai salah satu danau penting dari segi ekologi dan penelitian ilmiah di Indonesia.",
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
                            "Danau Poso terletak di Kabupaten Poso, Provinsi Sulawesi Tengah, Indonesia. Secara geografis, danau ini berada di Kota Tentena, yang terletak di rute jalur utama dari Toraja di bagian selatan dan Gorontalo-Manado di bagian utara . Danau Poso memiliki panjang sekitar 32 km dan lebar 16 km, menjadikannya sebagai danau terbesar ketiga di Indonesia setelah Danau Toba dan Danau Singkarak . Danau ini terletak pada ketinggian sekitar 657 meter di atas permukaan laut dan dikelilingi oleh hutan dan perbukitan yang menambah keindahannya . Akses menuju Danau Poso dapat dilakukan melalui perjalanan darat dari Kota Poso, yang berjarak sekitar 56 km ke arah selatan, dalam waktu sekitar satu setengah jam.",
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
                            "Danau Poso terbentuk melalui proses geologis yang berlangsung selama ribuan tahun, yang melibatkan aktivitas tektonik dan pergeseran lempeng bumi. Danau ini merupakan bagian dari sebuah cekungan yang terbentuk akibat pergerakan tektonik di wilayah Sulawesi Tengah, yang menyebabkan terjadinya penurunan permukaan tanah dan pengisian cekungan tersebut dengan air. Selain itu, proses vulkanik yang terjadi di masa lalu juga berkontribusi pada pembentukan danau ini. Secara lebih spesifik, Danau Poso merupakan hasil dari aktivitas patahan tektonik yang membentuk sebuah cekungan besar, kemudian terisi oleh air dari sungai-sungai dan mata air yang mengalir ke danau. Usia geologis yang sangat tua dan proses pembentukan yang kompleks ini menjadikan Danau Poso tidak hanya penting dari segi ekologi, tetapi juga memiliki nilai ilmiah yang tinggi dalam kajian geologi dan evolusi alam.",
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
                            "Danau Poso memiliki berbagai fungsi penting baik dari segi ekologis, sosial, maupun ekonomi. Secara ekologis, danau ini berfungsi sebagai habitat utama bagi berbagai spesies ikan endemik serta mendukung keseimbangan ekosistem perairan di kawasan Sulawesi Tengah. Danau Poso juga berperan sebagai sumber air tawar yang penting untuk pertanian dan kebutuhan rumah tangga masyarakat sekitar. Selain itu, danau ini menjadi tempat yang vital untuk kegiatan perikanan, baik secara tradisional maupun komersial. Dari segi pariwisata, Danau Poso menarik banyak pengunjung dengan keindahan alamnya yang memukau, serta keberadaan fenomena geologis dan budaya lokal yang kaya. Keberadaannya juga memiliki peran dalam penelitian ilmiah, khususnya di bidang ekologi dan geologi. Dengan demikian, Danau Poso menjadi aset yang sangat bernilai bagi masyarakat dan ekosistem sekitarnya.",
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
