import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Puncakjaya extends StatefulWidget {
  const Puncakjaya({super.key});

  @override
  _puncakjaya createState() => _puncakjaya();
}

class _puncakjaya extends State<Puncakjaya> {
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
          "Puncak Jaya",
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
                bookmarkProvider.isBookmarked("Gunung Puncakjaya");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Gunung Puncakjaya',
                  'image':
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ05aOg90voUUOz7CpSKGmi1STTbXbDhCBX886clx0hnCAvBIY6RokruwNt7Z_pGdDfKNU&usqp=CAU',
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
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ05aOg90voUUOz7CpSKGmi1STTbXbDhCBX886clx0hnCAvBIY6RokruwNt7Z_pGdDfKNU&usqp=CAU',
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
                            "Puncak Jaya adalah gunung tertinggi di Indonesia dan Oseania, dengan ketinggian sekitar 4.884 meter di atas permukaan laut. Terletak di Provinsi Papua, gunung ini juga dikenal sebagai Carstensz Pyramid. Keistimewaannya adalah sebagai satu-satunya gunung di Indonesia yang memiliki salju abadi. Gunung ini merupakan bagian dari Seven Summits, yaitu tujuh puncak tertinggi di setiap benua yang menjadi tantangan bagi para pendaki dunia. Pendakian ke Puncak Jaya terkenal sulit karena medan terjal dan cuaca ekstrem, namun pemandangannya yang spektakuler menjadikannya tujuan favorit bagi petualang. ",
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
                      buildTextRow("Ketinggian", "4.884 M"),
                      buildTextRow("Provinsi", "Papua"),
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
                      'Jenis Gunung',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Puncak Jaya adalah gunung jenis karst atau kapur yang terbentuk dari proses geologi ribuan tahun lalu. Gunung ini termasuk dalam kategori non-vulkanik, berbeda dengan kebanyakan gunung tinggi lainnya di Indonesia yang umumnya merupakan gunung berapi. Sebagai bagian dari Pegunungan Sudirman di Papua, Puncak Jaya memiliki medan berbatu yang curam dan menantang, menjadikannya salah satu gunung paling sulit untuk didaki di dunia. Gunung ini juga memiliki gletser tropis yang semakin menipis akibat perubahan iklim, menjadikannya salah satu fenomena alam yang unik di kawasan tropis.",
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
                      'Pendakian',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Puncak Jaya memiliki tingkat kesulitan pendakian yang sangat tinggi. Gunung ini terkenal dengan medannya yang curam, berbatu, dan membutuhkan keterampilan panjat tebing untuk mencapai puncaknya. Ditambah dengan cuaca yang ekstrem dan oksigen yang lebih tipis di ketinggian, pendakian ini hanya direkomendasikan bagi pendaki berpengalaman dengan persiapan yang matang. Rata-rata, waktu yang dibutuhkan untuk mendaki Puncak Jaya adalah sekitar 7 hingga 10 hari, tergantung pada kondisi fisik pendaki, cuaca, dan rute yang diambil. Pendakian biasanya dimulai dari Lembah Danau-Danau dan membutuhkan peralatan khusus serta panduan profesional.",
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
                      'Flora dan Fauna',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Puncak Jaya memiliki ekosistem yang unik dengan flora dan fauna yang beradaptasi dengan lingkungan pegunungan tinggi. Di ketinggian yang lebih rendah, hutan hujan tropis mendominasi dengan berbagai jenis pohon, lumut, dan pakis. Semakin tinggi, vegetasi semakin berkurang, dengan tundra alpina yang didominasi oleh lumut dan tanaman kecil yang tahan terhadap suhu dingin. Fauna di sekitar Puncak Jaya termasuk burung khas Papua seperti cenderawasih, kasuari, serta berbagai jenis reptil dan amfibi. Di ketinggian yang lebih rendah, mamalia seperti kuskus dan walabi pohon juga dapat ditemukan. Namun, karena kondisi ekstrem di puncak, sangat sedikit hewan yang dapat bertahan hidup di sana.",
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
                      'Suhu Ekstrim',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Puncak Jaya, juga dikenal sebagai Carstensz Pyramid, adalah gunung tertinggi di Indonesia dengan ketinggian 4.884 meter di atas permukaan laut. Terletak di Provinsi Papua, gunung ini memiliki iklim pegunungan tropis yang unik. Suhu rata-rata harian di puncaknya berkisar antara -2°C hingga 8°C, dengan suhu malam hari yang sering turun di bawah titik beku, bahkan mencapai -10°C. Perbedaan suhu antara siang dan malam cukup signifikan, dan kondisi cuaca dapat berubah dengan cepat. Curah hujan tahunan di kawasan ini mencapai sekitar 3.935 mm, dengan rata-rata 206 hari hujan per tahun. Kelembaban udara rata-rata tahunan adalah 83,9%. Kondisi cuaca yang ekstrem ini, termasuk kabut tebal yang sering muncul pada pagi dan sore hari, menjadikan pendakian ke Puncak Jaya sebagai tantangan yang memerlukan persiapan matang dan kewaspadaan tinggi.",
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
