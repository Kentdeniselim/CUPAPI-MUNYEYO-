import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Barito extends StatefulWidget {
  const Barito({super.key});

  @override
  _sungaibarito createState() => _sungaibarito();
}

class _sungaibarito extends State<Barito> {
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
          "Sungai Barito",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Sungai Barito");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Sungai Barito',
                  'image':
                      'https://tse2.mm.bing.net/th?id=OIP.rjPOKiu1sgQ5wJOd9nqjZgHaEK&w=266&h=266&c=7',
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
                  'https://tse2.mm.bing.net/th?id=OIP.rjPOKiu1sgQ5wJOd9nqjZgHaEK&w=266&h=266&c=7',
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
                            "Sungai Barito adalah sungai terpanjang di Kalimantan Selatan dan Kalimantan Tengah, dengan panjang sekitar 900 km. Sungai ini berhulu di Pegunungan Schwaner atau Müller dan bermuara di Laut Jawa. Sungai Barito sangat penting sebagai jalur transportasi dan sumber air bagi masyarakat di sepanjang alirannya. ",
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
                      buildTextRow("Panjang", "900 KM"),
                      buildTextRow("Mata Air", "Pegunungan Muller"),
                      buildTextRow("Provinsi", "Kalimantan Tengah"),
                      buildTextRow("Hilir", "Laut Jawa"),
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
                      'Sumber',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Barito berasal dari daerah pegunungan di Kalimantan Tengah, tepatnya dari Pegunungan Muller yang juga menjadi sumber bagi beberapa sungai besar di Kalimantan. Hulu Sungai Barito terletak di wilayah Kabupaten Barito Utara, dengan aliran sungai yang memanjang hingga mencapai Selat Makassar di bagian selatan Kalimantan. Sungai ini mengalir melalui daerah pedalaman yang dikelilingi oleh hutan tropis dan lahan basah, serta melintasi sejumlah danau besar, seperti Danau Tanjung dan Danau Melintang, sebelum akhirnya bermuara di wilayah Banjarmasin, ibu kota Provinsi Kalimantan Selatan. Sebagai salah satu sungai utama di Kalimantan, Sungai Barito memainkan peran penting dalam kehidupan sosial, ekonomi, dan ekologi masyarakat setempat.",
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
                            "Kedalaman Sungai Barito bervariasi sepanjang alirannya, tergantung pada lokasi dan musim. Di bagian hulu, terutama di daerah pegunungan, kedalamannya cenderung lebih dangkal, namun semakin menuju hilir, kedalaman sungai ini bisa mencapai 10 hingga 20 meter, bahkan lebih di beberapa titik. Di wilayah yang lebih dekat dengan Banjarmasin, terutama di daerah yang terhubung dengan delta, kedalaman sungai bisa lebih dalam, mencapai sekitar 30 meter. Kedalaman ini memungkinkan Sungai Barito untuk menjadi jalur transportasi penting bagi pengangkutan barang, seperti kayu dan hasil pertanian, serta mendukung kehidupan biota air tawar di sekitarnya. Namun, seperti sungai lainnya, sedimentasi akibat deforestasi dan aktivitas manusia dapat mempengaruhi kedalaman dan kondisi ekosistemnya.",
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
                      'Ekonomi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Barito memiliki peran yang sangat penting dalam perekonomian Kalimantan, terutama di wilayah Kalimantan Selatan dan Kalimantan Tengah. Sungai ini menjadi jalur transportasi utama untuk pengangkutan komoditas seperti kayu, batu bara, hasil pertanian, dan produk perikanan, yang sangat mendukung ekonomi lokal. Di sepanjang aliran sungai, masyarakat menggantungkan hidup pada sektor perikanan, baik dengan menangkap ikan secara tradisional maupun melalui budidaya ikan. Selain itu, Sungai Barito juga mendukung sektor pertanian, dengan menyediakan air untuk irigasi di daerah sekitar bantaran sungai. Selain itu, potensi pariwisata juga berkembang di sekitar sungai ini, dengan wisatawan yang tertarik pada budaya lokal, ekowisata, dan keindahan alam sepanjang aliran Sungai Barito. Dengan fungsinya yang begitu vital, Sungai Barito menjadi tulang punggung perekonomian bagi masyarakat yang tinggal di sepanjang alirannya.",
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
                      'Keanekaragaman Hayati',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Barito memiliki keanekaragaman hayati yang sangat kaya, menjadikannya sebagai salah satu ekosistem penting di Kalimantan. Sungai ini menjadi habitat bagi berbagai spesies ikan air tawar, seperti ikan patin, baung, lempung, dan ikan endemik lainnya yang banyak dimanfaatkan oleh masyarakat lokal untuk kebutuhan pangan dan perikanan. Selain ikan, sungai ini juga menjadi tempat hidup bagi berbagai spesies mamalia air dan burung air, serta merupakan jalur migrasi bagi beberapa jenis burung. Di sekitar aliran sungai, hutan tropis dan lahan basah yang meliputi kawasan rawa-rawa menjadi habitat bagi banyak spesies flora dan fauna, termasuk spesies langka seperti bekantan dan berbagai jenis monyet. Keanekaragaman flora di sekitar Sungai Barito juga mencakup berbagai pohon yang mendukung ekosistem hutan rawa, memberikan perlindungan terhadap keanekaragaman hayati yang ada di wilayah ini.",
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
                      'Ancaman Polusi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Barito menghadapi berbagai ancaman polusi yang dapat merusak kualitas air dan ekosistemnya. Salah satu sumber polusi utama berasal dari limbah industri, terutama dari aktivitas pertambangan batu bara dan pengolahan kayu di sepanjang aliran sungai, yang sering mencemari air dengan logam berat dan bahan kimia berbahaya. Selain itu, limbah rumah tangga dan sampah plastik yang dibuang sembarangan oleh pemukiman di tepi sungai turut memperburuk kondisi air. Praktik pertanian yang tidak ramah lingkungan, seperti penggunaan pestisida dan pupuk kimia, juga menyebabkan pencemaran air dan tanah di sekitar sungai. Aktivitas-aktivitas ini memperburuk sedimentasi dan mengancam keberlangsungan kehidupan biota air serta menurunkan kualitas air yang digunakan oleh masyarakat sekitar. Polusi ini, jika tidak ditangani dengan baik, bisa mengancam keseimbangan ekosistem Sungai Barito dan keberlanjutan sumber daya alam yang bergantung pada sungai tersebut.",
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
