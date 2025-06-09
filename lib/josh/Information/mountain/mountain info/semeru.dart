import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class Semeru extends StatefulWidget {
  const Semeru({super.key});

  @override
  _semeru createState() => _semeru();
}

class _semeru extends State<Semeru> {
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
          "Gunung Semeru",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Gunung Semeru");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Gunung Semeru',
                  'image':
                      'https://tse1.mm.bing.net/th/id/OIP.MVsvQLyOOxGarpLVFQNJvgHaE8?w=316&h=316&c=7',
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
                  'https://tse1.mm.bing.net/th/id/OIP.MVsvQLyOOxGarpLVFQNJvgHaE8?w=316&h=316&c=7',
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
                            "Gunung Semeru atau Gunung Meru adalah sebuah gunung berapi kerucut di Jawa Timur, Indonesia. Gunung Semeru merupakan gunung tertinggi di Pulau Jawa, dengan puncaknya Mahameru, 3.676 meter dari permukaan laut (mdpl). Gunung ini terbentuk akibat subduksi Lempeng Indo-Australia kebawah Lempeng Sunda. Gunung Semeru juga merupakan gunung berapi tertinggi ketiga di Indonesia setelah Gunung Kerinci di Sumatra dan Gunung Rinjani di Nusa Tenggara Barat.Kawah di puncak Gunung Semeru dikenal dengan nama Jonggring Saloko.",
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
                      buildTextRow("Ketinggian", "3.676 m"),
                      buildTextRow("Provinsi", "Jawa Timur"),
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
                            "Gunung Semeru adalah gunung berapi bertipe stratovolcano yang terletak di Provinsi Jawa Timur, Indonesia, dan merupakan gunung tertinggi di Pulau Jawa dengan ketinggian mencapai 3.676 meter di atas permukaan laut. Sebagai stratovolcano, Gunung Semeru terbentuk dari lapisan-lapisan lava, abu vulkanik, dan material letusan lainnya yang mengendap selama ribuan tahun akibat aktivitas vulkanik berulang. Gunung ini termasuk dalam kategori gunung berapi aktif, dengan kawah utamanya, yang dikenal sebagai Jonggring Saloko, secara berkala mengeluarkan asap, abu, dan letusan kecil. Aktivitas vulkaniknya tercatat sering terjadi, menjadikan Semeru sebagai salah satu gunung paling aktif di Indonesia. Gunung ini juga menjadi bagian dari Taman Nasional Bromo Tengger Semeru dan menjadi destinasi populer bagi para pendaki yang ingin menaklukkan atap tertinggi Pulau Jawa sambil menikmati keindahan alam dan tantangan ekstrem dari gunung berapi aktif ini.",
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
                            "Pendakian Gunung Semeru adalah salah satu pengalaman mendaki paling menantang dan populer di Indonesia, menarik ribuan pendaki setiap tahunnya. Jalur pendakian umumnya dimulai dari Ranu Pane, sebuah desa di kawasan Taman Nasional Bromo Tengger Semeru, dan memakan waktu sekitar 3 hingga 4 hari untuk mencapai puncak dan kembali. Selama perjalanan, pendaki akan melewati berbagai lanskap menakjubkan seperti danau Ranu Kumbolo yang indah, padang rumput luas Oro-Oro Ombo, serta tanjakan terjal Kalimat Suci dan Arcopodo yang menguji ketahanan fisik. Puncak Semeru, Mahameru, menyajikan pemandangan luar biasa dengan kawah aktif Jonggring Saloko yang sesekali memuntahkan asap dan material vulkanik. Karena merupakan gunung berapi aktif, pendakian menuju puncak dibatasi dan harus mengikuti panduan serta izin resmi dari pihak taman nasional demi keselamatan. Pendakian Gunung Semeru tidak hanya menawarkan tantangan fisik, tetapi juga pengalaman spiritual dan kedekatan dengan alam yang luar biasa.",
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
                            "Gunung Semeru, yang berada dalam kawasan Taman Nasional Bromo Tengger Semeru, memiliki keanekaragaman flora dan fauna yang sangat kaya dan menjadi bagian penting dari ekosistem pegunungan di Jawa Timur. Di lereng-lereng dan kaki gunung, hutan tropis yang lebat dihuni oleh berbagai jenis tumbuhan seperti **pinus, cemara gunung, edelweiss jawa**, serta pakis-pakisan yang mendominasi vegetasi di ketinggian. Kawasan ini juga menjadi habitat bagi berbagai jenis fauna, seperti **rusa, macan tutul jawa, kijang, lutung jawa**, dan **trenggiling**, yang hidup di dalam hutan-hutan pegunungan. Selain itu, Gunung Semeru juga menjadi tempat tinggal bagi beragam spesies burung, termasuk **elang jawa** yang merupakan satwa langka dan dilindungi. Keanekaragaman hayati ini menjadikan Gunung Semeru sebagai kawasan konservasi penting yang mendukung keseimbangan ekosistem dan menarik bagi para pecinta alam dan peneliti biologi.",
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
                            "Suhu di Gunung Semeru dapat sangat ekstrem, terutama di malam hari dan di puncak Mahameru yang berada pada ketinggian 3.676 meter di atas permukaan laut. Suhu udara di kawasan ini bisa turun hingga*0°C atau bahkan lebih rendah, terutama saat musim kemarau dan menjelang subuh, menyebabkan embun beku atau lapisan tipis es di beberapa area. Di siang hari, suhu bisa sedikit lebih hangat, berkisar antara 10°C hingga 15°C, namun tetap terasa dingin karena angin pegunungan yang menusuk. Perbedaan suhu yang tajam antara siang dan malam membuat pendakian Gunung Semeru membutuhkan persiapan matang, terutama dalam hal pakaian dan perlengkapan tidur untuk menjaga tubuh tetap hangat. Suhu yang ekstrem ini tidak hanya menjadi tantangan fisik bagi para pendaki, tetapi juga turut membentuk ekosistem khas pegunungan tinggi yang hanya bisa dihuni oleh flora dan fauna tertentu yang mampu beradaptasi dengan kondisi tersebut.",
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
