import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class BatangHari extends StatefulWidget {
  const BatangHari({super.key});

  @override
  _sungaibatanghari createState() => _sungaibatanghari();
}

class _sungaibatanghari extends State<BatangHari> {
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
          "Sungai Batang Hari",
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
                bookmarkProvider.isBookmarked("Sungai Batanghari");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Sungai Batanghari',
                  'image':
                      'https://tse3.mm.bing.net/th?id=OIP.ASrkBw24QNmhwUhNGvHFpgHaJQ&w=474&h=474&c=7',
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
                  'https://tse3.mm.bing.net/th?id=OIP.ASrkBw24QNmhwUhNGvHFpgHaJQ&w=474&h=474&c=7',
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
                            "Sungai Batanghari adalah sungai terpanjang di Pulau Sumatera, dengan panjang sekitar 800 km. Sungai ini bermuara di antara Selat Malaka dan Selat Karimata, dan merupakan sumber kehidupan dan transportasi penting di wilayahnya. Sungai ini juga memiliki sejarah panjang dan peran penting dalam peradaban Melayu.",
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
                      buildTextRow("Panjang", "800 KM"),
                      buildTextRow("Mata Air", "Gunung Rasan"),
                      buildTextRow("Provinsi", "Sumatera Barat(Jambi)"),
                      buildTextRow("Hilir", "Muara Sabak"),
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
                            "Sungai Batanghari, sungai terpanjang di Pulau Sumatera, bermula dari Gunung Rasan di Kabupaten Solok, Provinsi Sumatera Barat. Dari sana, sungai ini mengalir melalui wilayah Bukit Barisan, pegunungan yang menjadi sumber utama bagi banyak sungai besar di Sumatera . Panjang total Sungai Batanghari diperkirakan sekitar 800 hingga 870 kilometer, membentang melewati beberapa kabupaten di Provinsi Jambi sebelum bermuara di Selat Berhala, yang memisahkan Pulau Sumatera dan Pulau Lingga . Sungai ini memiliki luas daerah aliran sungai (DAS) sekitar 46.504 km², menjadikannya sebagai salah satu DAS terbesar di Indonesia . Sungai Batanghari memainkan peran penting dalam kehidupan masyarakat sekitar, baik sebagai sumber air, transportasi, maupun sebagai sumber kehidupan bagi flora dan fauna di sekitarnya .",
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
                            "Kedalaman Sungai Batanghari bervariasi di sepanjang alirannya, tergantung pada lokasi dan musim. Di bagian hulu sungai, kedalamannya relatif lebih dangkal, namun semakin mendekati hilir, kedalaman sungai ini bisa mencapai 10 hingga 20 meter. Di beberapa titik yang lebih dekat dengan muara, kedalamannya bisa lebih dalam, bahkan mencapai 30 meter. Kedalaman sungai yang cukup dalam ini memungkinkan berbagai kapal dan perahu besar untuk melintasi sungai, sehingga penting sebagai jalur transportasi utama bagi masyarakat di sekitar Sungai Batanghari. Selain itu, kedalaman ini juga mendukung kehidupan berbagai spesies ikan dan ekosistem perairan yang ada di sungai tersebut.",
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
                            "Sungai Batanghari memiliki peran yang sangat penting dalam perekonomian wilayah Jambi dan sekitarnya. Sebagai sungai terpanjang di Pulau Sumatera, Batanghari digunakan sebagai jalur transportasi utama untuk pengangkutan barang seperti hasil pertanian, kayu, dan komoditas lainnya, yang mendukung aktivitas ekonomi masyarakat setempat. Sungai ini juga menjadi sumber kehidupan bagi sektor perikanan, dengan masyarakat yang mengandalkan tangkapan ikan dari sungai untuk memenuhi kebutuhan pangan dan mata pencaharian. Selain itu, Batanghari menyediakan air untuk irigasi pertanian, yang sangat penting bagi produksi pangan di sepanjang alirannya. Dalam sektor pariwisata, Sungai Batanghari juga berpotensi sebagai daya tarik wisata alam, dengan berbagai wisata susur sungai dan keindahan alam di sekitarnya. Dengan berbagai fungsinya, Sungai Batanghari menjadi tulang punggung ekonomi yang vital bagi masyarakat di sekitarnya.",
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
                            "Sungai Batanghari memiliki keanekaragaman hayati yang sangat kaya dan menjadi rumah bagi berbagai spesies flora dan fauna. Di sepanjang alirannya, sungai ini mendukung kehidupan berbagai jenis ikan air tawar seperti ikan baung, patin, lempung, dan ikan endemik lainnya, yang menjadi sumber pangan penting bagi masyarakat setempat. Selain itu, kawasan sekitar sungai juga merupakan habitat bagi berbagai spesies burung air, seperti bangau dan pelikan, yang sering terlihat di sepanjang tepian sungai. Hutan rawa dan lahan basah di sekitar Sungai Batanghari menyokong ekosistem yang kaya akan keanekaragaman flora, termasuk pohon-pohon besar dan tanaman rawa. Keanekaragaman hayati ini sangat penting untuk menjaga keseimbangan ekosistem dan mendukung kehidupan masyarakat yang bergantung pada sumber daya alam dari sungai tersebut.",
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
                            "Sungai Batanghari menghadapi berbagai ancaman polusi yang dapat merusak ekosistem dan kualitas airnya. Salah satu sumber polusi utama adalah limbah industri, terutama dari aktivitas pertambangan, pengolahan kayu, dan pabrik-pabrik yang terletak di sepanjang aliran sungai. Limbah cair dan bahan kimia berbahaya yang dibuang ke sungai sering mencemari air dan merusak habitat biota air. Selain itu, pencemaran plastik dan sampah rumah tangga yang dibuang sembarangan juga memperburuk kualitas air. Aktivitas pertanian yang tidak ramah lingkungan, seperti penggunaan pestisida dan pupuk kimia, juga turut menyumbang pada pencemaran sungai. Sedimentasi akibat deforestasi dan penggundulan hutan di daerah hulu sungai memperburuk kondisi ekosistem, mengurangi kedalaman sungai, dan mengancam keberlanjutan kehidupan spesies yang bergantung pada air sungai. Polusi ini tidak hanya mengancam kesehatan ekosistem, tetapi juga membahayakan mata pencaharian masyarakat yang bergantung pada sungai untuk perikanan dan pertanian.",
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
