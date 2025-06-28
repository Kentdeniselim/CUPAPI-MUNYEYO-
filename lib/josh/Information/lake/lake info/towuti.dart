import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Towuti extends StatefulWidget {
  const Towuti({super.key});

  @override
  _danautowuti createState() => _danautowuti();
}

class _danautowuti extends State<Towuti> {
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
          "Danau Towuti",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Danau Towuti");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Danau Towuti',
                  'image':
                      'https://tse1.mm.bing.net/th/id/OIP.zxN0nrBHh_ignslgSSeOIgHaE_?w=319&h=319&c=7',
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
                  'https://tse1.mm.bing.net/th/id/OIP.zxN0nrBHh_ignslgSSeOIgHaE_?w=319&h=319&c=7',
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
                            "Danau Towuti adalah danau air tawar terbesar kedua di Indonesia setelah Danau Toba, dengan luas sekitar 561,1 km². Terletak di Sulawesi Selatan, tepatnya di Kabupaten Luwu Timur, dan dikenal sebagai danau tektonik purba dengan kedalaman maksimum 203 meter. Danau ini juga memiliki lima pulau di tengahnya, di antaranya Pulau Loeha, Pulau Bolong, dan Pulau Kembar. ",
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
                      buildTextRow("Luas", "561,1 Kilometer Persegi"),
                      buildTextRow("Kedalaman", "230 M"),
                      buildTextRow("Provinsi", "Sulawesi Selatan"),
                      buildTextRow(
                        "Ikan",
                        " Ikan Pangkilang (Tominanga sanguicauda) ,Ikan Dui-Dui (Dermogenys megarrhamphus), Ikan Mujair, Ikan mas, dan Ikan Nila. ",
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
                            "Danau Towuti, yang terletak di Provinsi Sulawesi Selatan, merupakan salah satu danau terbesar dan terdalam di Indonesia. Kedalaman maksimum danau ini mencapai sekitar 203 meter, menjadikannya danau terdalam kedua di Indonesia setelah Danau Matano. Dengan luas permukaan sekitar 561 kilometer persegi, Danau Towuti memiliki karakteristik yang unik, termasuk kedalaman yang luar biasa dan air yang relatif jernih. Kedalaman ini menciptakan habitat yang ideal bagi berbagai spesies endemik yang tidak ditemukan di tempat lain. Selain itu, kedalaman Danau Towuti juga berperan penting dalam menjaga kestabilan suhu air dan keseimbangan ekosistemnya. Kombinasi antara ukuran, kedalaman, dan keanekaragaman hayati menjadikan Danau Towuti sebagai salah satu kawasan perairan yang penting secara ekologis dan ilmiah di Indonesi",
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
                            "Danau Towuti terletak di Kecamatan Towuti, Kabupaten Luwu Timur, Provinsi Sulawesi Selatan, Indonesia. Danau ini merupakan bagian dari sistem Danau Malili dan merupakan danau terbesar di Sulawesi serta danau air tawar terbesar kedua di Indonesia setelah Danau Toba. Danau Towuti berada pada ketinggian sekitar 293 meter di atas permukaan laut dan memiliki kedalaman maksimum sekitar 203 meter. Letaknya sekitar 50 kilometer dari Kota Malili, ibu kota Kabupaten Luwu Timur, dan dapat dicapai melalui perjalanan darat dengan kondisi jalan yang relatif baik. Danau ini juga dikenal sebagai salah satu danau purba tertua di dunia, yang terbentuk dari aktivitas tektonik jutaan tahun lalu, menjadikannya situs penting untuk penelitian ilmiah dan konservasi.",
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
                            "Danau Towuti memiliki asal usul geologis yang sangat menarik karena terbentuk dari aktivitas tektonik jutaan tahun yang lalu. Danau ini merupakan bagian dari sistem Danau Malili yang terdiri dari beberapa danau purba di Sulawesi Selatan dan dikenal sebagai salah satu danau tertua di dunia. Proses terbentuknya terjadi akibat pergerakan lempeng tektonik yang menciptakan cekungan besar, yang kemudian terisi air dan membentuk danau. Karena usia geologisnya yang sangat tua, Danau Towuti menjadi tempat berkembangnya berbagai spesies endemik yang berevolusi secara unik dan hanya ditemukan di kawasan ini. Keunikan asal usul Danau Towuti tidak hanya penting secara ilmiah, tetapi juga menjadikan danau ini sebagai laboratorium alami yang sangat bernilai untuk penelitian tentang evolusi, geologi, dan konservasi biodiversitas.",
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
                            "Danau Towuti memiliki berbagai fungsi penting baik dari segi ekologis, sosial, maupun ekonomi. Secara ekologis, danau ini berfungsi sebagai habitat bagi berbagai spesies endemik dan menjadi bagian dari sistem air tawar yang menjaga keseimbangan ekosistem di wilayah Sulawesi Selatan. Danau ini juga berperan sebagai sumber air bagi masyarakat sekitar, serta mendukung irigasi pertanian dan kegiatan perikanan air tawar yang menjadi mata pencaharian utama bagi sebagian penduduk lokal. Selain itu, Danau Towuti memiliki potensi besar dalam sektor pariwisata karena keindahan alamnya yang memikat dan nilai sejarah geologisnya sebagai salah satu danau tertua di dunia. Di sisi lain, danau ini juga dimanfaatkan untuk penelitian ilmiah, terutama dalam studi geologi, biologi, dan konservasi lingkungan. Dengan berbagai fungsi tersebut, Danau Towuti menjadi aset alam yang sangat penting untuk dilestarikan demi keberlanjutan kehidupan masyarakat dan kelestarian alam sekitarnya.",
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
