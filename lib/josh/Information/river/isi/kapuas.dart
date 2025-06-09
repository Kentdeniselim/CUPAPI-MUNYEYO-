import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class Kapuas extends StatefulWidget {
  const Kapuas({super.key});

  @override
  _sungaikapuas createState() => _sungaikapuas();
}

class _sungaikapuas extends State<Kapuas> {
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
          "Sungai Kapuas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Sungai Kapuas");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Sungai Kapuas',
                  'image':
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUg06CTi4NevuJj14xYEgovs528b00jUVF_w&s',
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
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUg06CTi4NevuJj14xYEgovs528b00jUVF_w&s',
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
                            "Sungai Kapuas adalah sungai terpanjang di Indonesia, membentang sekitar 1.143 km melintasi Provinsi Kalimantan Barat. Sungai ini berperan penting dalam kehidupan masyarakat setempat sebagai jalur transportasi utama, sumber air, serta ekosistem bagi berbagai flora dan fauna. Kapuas juga memiliki keanekaragaman hayati yang tinggi, termasuk hutan bakau, ikan endemik, dan habitat bagi satwa liar seperti buaya muara. Selain itu, sungai ini menjadi pusat aktivitas ekonomi, dari perikanan hingga perdagangan, yang mendukung kehidupan masyarakat di sepanjang alirannya.",
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
                      buildTextRow("Panjang", "1,143 KM"),
                      buildTextRow("Mata Air", "Pegunungan Muller"),
                      buildTextRow("Provinsi", "Kalimantan Barat"),
                      buildTextRow("Hilir", "Selat Karimata"),
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
                            "Sungai Kapuas memiliki sumber air yang berasal dari Pegunungan Müller di Kalimantan. Pegunungan ini menjadi titik awal aliran sungai yang kemudian mengalir sepanjang lebih dari 1.143 km, menjadikannya sungai terpanjang di Indonesia. Air dari Pegunungan Müller berasal dari curah hujan tinggi yang meresap ke dalam tanah dan membentuk mata air serta anak sungai kecil yang bergabung membentuk aliran utama Sungai Kapuas.",
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
                            "Kedalaman rata-rata Sungai Kapuas bervariasi tergantung pada lokasinya, tetapi secara umum berkisar antara 6 hingga 27 meter. Di beberapa bagian tertentu, terutama di daerah hilir yang lebih dekat ke laut, kedalamannya bisa mencapai lebih dari 30 meter. Kedalaman ini memungkinkan Sungai Kapuas menjadi jalur transportasi utama bagi kapal-kapal besar yang menghubungkan berbagai wilayah di Kalimantan Barat.",
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
                            "Secara ekonomi, Sungai Kapuas memiliki peran yang sangat penting bagi masyarakat di sekitarnya. Sungai ini menjadi jalur transportasi utama untuk perdagangan dan distribusi barang di pedalaman Kalimantan Barat. Sektor perikanan juga berkembang pesat dengan hasil tangkapan ikan yang menjadi sumber mata pencaharian bagi banyak nelayan. Selain itu, Sungai Kapuas mendukung industri kehutanan, pertanian, dan pariwisata, terutama dengan adanya ekowisata yang menarik wisatawan untuk menikmati keindahan alam dan keanekaragaman hayatinya. Namun, eksploitasi sumber daya alam yang berlebihan dan pencemaran air menjadi ancaman bagi keberlanjutan ekonomi berbasis sungai ini.",
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
                            "Sungai Kapuas memiliki keanekaragaman hayati yang sangat kaya, menjadikannya salah satu ekosistem air tawar paling penting di Indonesia. Sungai ini menjadi habitat bagi lebih dari 300 spesies ikan, termasuk ikan arwana super red yang bernilai tinggi. Selain itu, berbagai jenis reptil seperti buaya muara dan ular sanca juga ditemukan di perairan ini. Hutan di sepanjang sungai menjadi rumah bagi mamalia seperti orangutan, bekantan, dan berbagai jenis kelelawar. Beragam burung air, seperti bangau dan elang ikan, juga bergantung pada ekosistem sungai ini untuk berburu makanan.",
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
                            "Sungai Kapuas menghadapi berbagai ancaman, terutama dari polusi, deforestasi, dan eksploitasi sumber daya yang berlebihan. Limbah domestik dan industri sering kali mencemari air sungai, mengancam kualitas air dan kehidupan akuatik. Penebangan hutan di sekitar sungai menyebabkan erosi tanah dan sedimentasi yang dapat menghambat aliran air. Selain itu, aktivitas penambangan emas ilegal yang menggunakan merkuri meningkatkan kadar racun di sungai, membahayakan ekosistem dan kesehatan manusia. Jika tidak dikelola dengan baik, ancaman ini dapat merusak keanekaragaman hayati dan mengganggu kehidupan masyarakat yang bergantung pada sungai ini.",
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
