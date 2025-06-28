import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Tempe extends StatefulWidget {
  const Tempe({super.key});

  @override
  _danautempe createState() => _danautempe();
}

class _danautempe extends State<Tempe> {
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
          "Danau Tempe",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Danau Tempe");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Danau Tempe',
                  'image':
                      'https://tse3.mm.bing.net/th?id=OIP.epaPW0Kubfu_T_0ladRN_gHaFj&w=355&h=355&c=7',
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
                  'https://tse3.mm.bing.net/th?id=OIP.epaPW0Kubfu_T_0ladRN_gHaFj&w=355&h=355&c=7',
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
                            "Danau Tempe adalah danau purba yang terletak di Sulawesi Selatan, Indonesia. Danau ini dianggap sebagai danau tektonik yang terbentuk bersamaan dengan daratan Sulawesi. Luasnya sekitar 13.000 hektar dan memiliki keliling sekitar 70 km. ",
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
                      buildTextRow("Luas", "350 km²"),
                      buildTextRow("Kedalaman", "5 M"),
                      buildTextRow("Provinsi", "Sulawesi Selatan"),
                      buildTextRow(
                        "Ikan",
                        "Ikan Nilem, Ikan Gabus, Ikan Nila, Ikan Sepat Siam",
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
                            "Danau Tempe, yang terletak di Kabupaten Wajo, Sulawesi Selatan, memiliki kedalaman yang relatif dangkal dibandingkan danau besar lainnya di Indonesia. Kedalaman rata-rata Danau Tempe berkisar antara 2 hingga 5 meter, tergantung pada musim dan curah hujan. Saat musim hujan, permukaan air danau akan naik dan menambah kedalamannya, sementara di musim kemarau, kedalamannya bisa menyusut cukup drastis. Meskipun tidak terlalu dalam, danau ini memiliki luas yang cukup besar dan berfungsi penting sebagai sumber air, habitat perikanan, serta area penyangga ekosistem. Kedalaman yang dangkal juga membuat danau ini mudah dipengaruhi oleh sedimentasi dan perubahan kualitas air, sehingga pengelolaan lingkungan di sekitarnya menjadi hal yang penting untuk menjaga kelestariannya.",
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
                            "Danau Tempe terletak di bagian barat Kabupaten Wajo, Sulawesi Selatan, dan merupakan salah satu danau terbesar di provinsi tersebut. Danau ini membentang melintasi beberapa kecamatan, termasuk Kecamatan Tempe, Belawa, Tanah Sitolo, Maniangpajo, dan Sabbangparu. Lokasinya berada sekitar 7 kilometer dari Kota Sengkang, ibu kota Kabupaten Wajo, dan dapat dicapai melalui perjalanan darat dari Makassar dengan waktu tempuh sekitar 6 jam. Selain itu, Danau Tempe juga berbatasan dengan Kabupaten Sidenreng Rappang dan Kabupaten Soppeng, menjadikannya sebagai danau yang strategis dan penting bagi ekosistem serta kehidupan masyarakat di sekitarnya.",
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
                            "Danau Tempe memiliki asal usul yang erat kaitannya dengan sejarah geologi dan perubahan alam yang terjadi di wilayah Sulawesi Selatan. Danau ini terbentuk melalui proses tektonik dan pengendapan yang berlangsung selama ribuan tahun. Diperkirakan bahwa Danau Tempe berasal dari perubahan aliran sungai yang menyebabkan terbentuknya cekungan luas yang kemudian terisi air, menciptakan danau yang kini kita kenal. Selain itu, danau ini juga dipengaruhi oleh perubahan iklim dan aktivitas vulkanik di masa lalu yang membentuk lanskap dataran rendah di sekitar wilayah tersebut. Danau Tempe, yang merupakan bagian dari ekosistem Delta Wajo, telah menjadi pusat kehidupan bagi masyarakat setempat, terutama dalam bidang perikanan dan pertanian. Seiring berjalannya waktu, danau ini juga menyimpan nilai budaya yang dalam bagi masyarakat Wajo, yang menjadikannya sebagai bagian penting dalam sejarah dan identitas mereka.",
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
                            "Danau Tempe memiliki berbagai fungsi yang sangat penting baik bagi ekosistem maupun masyarakat di sekitarnya. Secara ekologis, danau ini berperan sebagai habitat utama bagi berbagai spesies ikan dan merupakan bagian penting dari sistem perairan yang mendukung kehidupan flora dan fauna lokal. Selain itu, Danau Tempe juga berfungsi sebagai sumber utama air tawar bagi pertanian di kawasan sekitarnya, dengan irigasi yang mengalirkan air untuk ladang dan sawah penduduk. Di bidang sosial dan ekonomi, danau ini menjadi sumber kehidupan bagi banyak keluarga yang menggantungkan penghidupan mereka pada perikanan, terutama budidaya ikan air tawar. Selain itu, Danau Tempe juga memiliki potensi pariwisata yang besar, dengan keindahan alamnya yang memikat dan atraksi unik seperti rumah terapung yang menjadi daya tarik pengunjung. Sebagai bagian dari ekosistem delta, danau ini juga berperan penting dalam menjaga keseimbangan alam dan kualitas air di wilayah sekitarnya.",
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
