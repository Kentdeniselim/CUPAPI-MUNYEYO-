import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Kerinci extends StatefulWidget {
  const Kerinci({super.key});

  @override
  _kerinci createState() => _kerinci();
}

class _kerinci extends State<Kerinci> {
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
          "Gunung Kerinci",
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
                bookmarkProvider.isBookmarked("Gunung Kerinci");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Gunung Kerinci',
                  'image':
                      'https://tse3.mm.bing.net/th?id=OIP.fbsXI_Uox_ldHzlwpS2OqgHaEE&w=260&h=260&c=7',
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
                  'https://tse3.mm.bing.net/th?id=OIP.fbsXI_Uox_ldHzlwpS2OqgHaEE&w=260&h=260&c=7',
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
                            "Gunung Kerinci adalah gunung tertinggi di Sumatera dan gunung berapi tertinggi di Indonesia (di luar Papua), dengan ketinggian 3.805 mdpl. Gunung berapi stratovolcano yang masih aktif ini terletak di Provinsi Jambi, di Pegunungan Bukit Barisan, dan dikelilingi oleh Taman Nasional Kerinci Seblat. ",
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
                      buildTextRow("Ketinggian", "3.805 M"),
                      buildTextRow("Provinsi", "Sumatera Barat"),
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
                            "Gunung Kerinci adalah sebuah gunung berapi aktif yang terletak di perbatasan antara Provinsi Jambi dan Sumatera Barat, Indonesia. Dengan ketinggian mencapai 3.805 meter di atas permukaan laut, Gunung Kerinci merupakan gunung tertinggi di Pulau Sumatera dan salah satu gunung berapi paling aktif di Indonesia. Gunung ini termasuk dalam kategori stratovolcano, yang berarti memiliki bentuk kerucut dengan lapisan-lapisan lava yang terbentuk dari letusan-letusan sebelumnya. Aktivitas vulkaniknya masih terjadi hingga saat ini, dengan erupsi yang kadang-kadang melepaskan abu vulkanik dan gas beracun. Gunung Kerinci juga berada di dalam Taman Nasional Kerinci Seblat, yang merupakan kawasan konservasi penting dan kaya akan keanekaragaman hayati, termasuk spesies langka seperti Harimau Sumatera dan Orangutan Sumatera. Aktivitas vulkanik serta keindahan alam Gunung Kerinci menjadikannya sebagai salah satu destinasi pendakian favorit bagi para petualang dan pecinta alam.",
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
                            "Pendakian Gunung Kerinci menawarkan pengalaman yang menantang dan memukau bagi para pendaki. Sebagai gunung tertinggi di Pulau Sumatera, Gunung Kerinci memiliki jalur pendakian yang cukup berat, dengan waktu tempuh sekitar 8 hingga 12 jam untuk mencapai puncak dari basecamp. Pendaki akan melewati berbagai medan, mulai dari hutan tropis yang lebat, jalur berbatu, hingga lautan pasir yang mengarah ke puncak. Selama pendakian, para pendaki dapat menikmati pemandangan alam yang menakjubkan, termasuk keanekaragaman hayati yang ada di Taman Nasional Kerinci Seblat, tempat tinggal banyak spesies langka. Puncak Gunung Kerinci menawarkan panorama luar biasa, dengan kawah aktif yang mengeluarkan asap belerang dan pemandangan luas ke pegunungan sekitarnya. Pendakian ini cukup berat, sehingga para pendaki disarankan untuk mempersiapkan fisik dengan baik dan mengikuti panduan dari pemandu berlisensi untuk memastikan keselamatan selama perjalanan.",
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
                            "Gunung Kerinci, yang terletak di Taman Nasional Kerinci Seblat, merupakan rumah bagi keanekaragaman flora dan fauna yang sangat kaya. Kawasan ini memiliki berbagai jenis vegetasi, mulai dari hutan tropis dataran rendah hingga hutan montana di ketinggian yang lebih tinggi. Beberapa jenis flora yang ditemukan di sekitar Gunung Kerinci antara lain pohon damar, rotan, dan berbagai jenis anggrek endemik. Keanekaragaman faunanya juga sangat luar biasa, dengan adanya spesies langka seperti Harimau Sumatera, Orangutan Sumatera, dan Rusa Sambar. Selain itu, burung endemik seperti Elang Jawa dan berbagai spesies burung lainnya juga mendiami daerah ini. Gunung Kerinci dan sekitarnya menjadi ekosistem yang vital bagi kelangsungan hidup banyak spesies yang terancam punah, menjadikannya sebagai kawasan konservasi yang sangat penting. Keberadaan flora dan fauna ini juga menjadi daya tarik bagi para peneliti dan pecinta alam yang tertarik pada keanekaragaman hayati di Indonesia.",
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
                            "Suhu di Gunung Kerinci dapat sangat ekstrim, terutama di puncaknya yang mencapai ketinggian 3.805 meter di atas permukaan laut. Di malam hari, suhu bisa turun drastis hingga mencapai 0°C atau bahkan di bawahnya, terutama saat musim kemarau, yang menjadikan pendakian di gunung ini menantang dan memerlukan persiapan matang. Pada siang hari, meskipun suhu bisa lebih hangat, udara di ketinggian tersebut tetap terasa sejuk dan segar, dengan suhu rata-rata sekitar 10°C hingga 15°C. Perbedaan suhu yang tajam antara siang dan malam serta di berbagai ketinggian membuat pendakian Gunung Kerinci memerlukan perlengkapan yang tepat, seperti pakaian tebal dan pelindung diri lainnya. Suhu ekstrem ini juga berperan dalam menciptakan ekosistem yang khas dan mendukung kehidupan flora dan fauna yang mampu beradaptasi dengan kondisi tersebut.",
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
