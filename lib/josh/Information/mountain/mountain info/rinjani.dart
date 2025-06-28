import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Rinjani extends StatefulWidget {
  const Rinjani({super.key});

  @override
  _rinjani createState() => _rinjani();
}

class _rinjani extends State<Rinjani> {
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
          "Gunung Rinjani",
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
                bookmarkProvider.isBookmarked("Gunung Rinjani");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Gunung Rinjani',
                  'image':
                      'https://tse1.mm.bing.net/th?id=OIP.DH8Be3S1MgSzqTG-jsMSXAHaE8&w=316&h=316&c=7',
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
                  'https://tse1.mm.bing.net/th?id=OIP.DH8Be3S1MgSzqTG-jsMSXAHaE8&w=316&h=316&c=7',
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
                            "Gunung Rinjani adalah gunung yang berlokasi di Pulau Lombok, Nusa Tenggara Barat. Gunung yang merupakan gunung berapi kedua tertinggi di Indonesia dengan ketinggian 3.726 mdpl serta terletak pada lintang 8º25' LS dan 116º28' BT ini merupakan gunung favorit bagi pendaki Indonesia karena keindahan pemandangannya. Gunung ini merupakan bagian dari Taman Nasional Gunung Rinjani yang memiliki luas sekitar 41.330 ha dan diusulkan penambahannya sehingga menjadi 76.000 ha ke arah barat dan timur.",
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
                      buildTextRow("Ketinggian", "3.726 m"),
                      buildTextRow("Provinsi", "Nusa Tengara Barat"),
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
                            "Gunung Rinjani adalah sebuah gunung berapi aktif yang terletak di Pulau Lombok, Nusa Tenggara Barat, Indonesia. Dengan ketinggian mencapai 3.726 meter di atas permukaan laut, Gunung Rinjani adalah gunung tertinggi kedua di Indonesia setelah Gunung Kerinci. Gunung ini termasuk dalam kategori stratovolcano, yang berarti terbentuk dari lapisan-lapisan lava yang dihasilkan oleh letusan-letusan vulkanik sebelumnya. Rinjani memiliki kawah besar di puncaknya yang membentuk Danau Segara Anak, sebuah danau vulkanik yang menjadi salah satu daya tarik utama bagi para pendaki. Aktivitas vulkanik Gunung Rinjani masih berlangsung, meskipun tidak sering meletus, dan kawah serta fumarolanya menandakan bahwa gunung ini masih aktif. Gunung Rinjani juga dikelilingi oleh Taman Nasional Gunung Rinjani, yang kaya akan keanekaragaman hayati, menjadikannya sebagai tempat pendakian yang populer bagi para petualang dan pecinta alam.",
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
                            "Pendakian Gunung Rinjani menawarkan pengalaman yang luar biasa bagi para petualang, dengan tantangan dan pemandangan yang menakjubkan sepanjang perjalanan. Gunung Rinjani memiliki beberapa jalur pendakian yang populer, dengan waktu tempuh yang bervariasi antara **2 hingga 4 hari** tergantung pada jalur yang dipilih dan kecepatan pendaki. Perjalanan dimulai dari kaki gunung yang dipenuhi hutan tropis, kemudian naik melewati sabana dan bebatuan hingga mencapai puncak yang menawarkan panorama luar biasa, termasuk pemandangan kawah besar dan Danau Segara Anak yang menakjubkan. Selama pendakian, pendaki akan melewati berbagai ekosistem, termasuk hutan hujan tropis dan padang rumput alpine yang penuh dengan bunga edelweiss. Meskipun pendakian ini cukup menantang dan memerlukan persiapan fisik yang baik, puncak Gunung Rinjani memberikan hadiah berupa pemandangan spektakuler dan rasa pencapaian yang luar biasa. Karena Gunung Rinjani adalah kawasan konservasi, pendakian harus dilakukan dengan mengikuti regulasi yang ditetapkan dan disarankan menggunakan pemandu berlisensi untuk memastikan keselamatan selama perjalanan.",
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
                            "Gunung Rinjani, yang terletak di Pulau Lombok, memiliki keanekaragaman flora dan fauna yang luar biasa, menjadikannya sebagai salah satu kawasan ekosistem yang penting di Indonesia. Di kawasan hutan kaki gunung, tumbuh berbagai jenis flora tropis, termasuk pohon-pohon besar seperti meranti dan rotan, serta tanaman endemik seperti **edelweiss** yang tumbuh di daerah ketinggian lebih tinggi. Di sekitar Danau Segara Anak, yang terletak di dalam kawah Rinjani, ditemukan vegetasi khas daerah pegunungan. Selain flora, Gunung Rinjani juga menjadi habitat bagi berbagai jenis fauna, termasuk **monyet ekor panjang**, **macan tutul**, dan **kijang** yang hidup di hutan sekitarnya. Burung-burung seperti **elang jawa** dan **burung hantu** juga dapat ditemukan di kawasan ini. Keanekaragaman hayati ini menjadikan Gunung Rinjani sebagai kawasan konservasi yang penting, dengan banyak spesies langka yang dilindungi. Keindahan alam dan keanekaragaman flora serta fauna di Rinjani menjadi daya tarik utama bagi para pendaki dan pecinta alam yang ingin menikmati keindahan alam sambil mendalami ekosistemnya.",
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
                            "Suhu di Gunung Rinjani dapat sangat ekstrim, terutama di puncaknya yang mencapai ketinggian **3.726 meter di atas permukaan laut**. Di malam hari, suhu dapat turun drastis hingga mencapai **0°C atau bahkan di bawahnya**, terutama selama musim kemarau, menciptakan kondisi yang sangat dingin dan membutuhkan perlengkapan pendakian yang tepat, seperti jaket tebal dan sleeping bag yang hangat. Sementara itu, pada siang hari, suhu di area sekitar kawah dan puncak bisa berada di kisaran **10°C hingga 20°C**, meskipun tetap terasa sejuk. Perbedaan suhu yang tajam antara siang dan malam serta di berbagai ketinggian memberikan tantangan tersendiri bagi para pendaki. Selain itu, suhu yang ekstrem di puncak Rinjani turut membentuk ekosistem yang khas dan mendukung keberadaan flora serta fauna yang mampu beradaptasi dengan kondisi tersebut. Pendaki harus mempersiapkan diri dengan baik agar dapat menghadapi suhu ekstrim ini selama perjalanan.",
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
