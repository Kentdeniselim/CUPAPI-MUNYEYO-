import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class Michelia extends StatefulWidget {
  const Michelia({super.key});

  @override
  _michelia createState() => _michelia();
}

class _michelia extends State<Michelia> {
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
          "Bunga Michelia",
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
                bookmarkProvider.isBookmarked("Bunga Michellia");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Bunga Michellia',
                  'image':
                      'https://tse2.mm.bing.net/th?id=OIP.yAhP1DcJDA0LjE1U2X5JtQHaE9&w=317&h=317&c=7',
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
                  'https://tse2.mm.bing.net/th?id=OIP.yAhP1DcJDA0LjE1U2X5JtQHaE9&w=317&h=317&c=7',
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
                            "Michelia adalah salah satu kelompok tumbuhan berbunga anggota suku Magnoliaceae. Sebelum 2000, kelompok ini menyandang posisi takson genus (genus), namun sejak keluarnya hasil kajian molekuler,banyak pihak memasukkannya sebagai salah satu sectio (seksi) dari marga Magnolia.Kelompok ini beranggota sekitar 50 spesies pohon atau perdu hijau abadi yang tumbuh di daerah tropis dan subtropis di Asia Selatan dan Asia Tenggara serta Tiongkok selatan. Berbagai jenis cempaka merupakan anggota-anggotanya yang paling banyak dikenal orang.",
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
                      buildTextRow("Kerajaan", "Plantae"),
                      buildTextRow("Ordo", "Mongoliales"),
                      buildTextRow("Family", "Magnoliaceae"),
                      buildTextRow("Genus", "Magnolia/Michelia"),
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
                      'Persebaran',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Bunga Michelia, yang dikenal dengan nama ilmiahMichelia spp, tersebar luas di kawasan tropis dan subtropis, terutama di Asia Tenggara, India, serta sebagian wilayah di Asia Timur. Di Indonesia, bunga ini dapat ditemukan di berbagai pulau besar, seperti Sumatra, Jawa, Kalimantan, dan Sulawesi, tumbuh di hutan-hutan dataran rendah hingga pegunungan dengan ketinggian tertentu. Beberapa spesies Michelia, seperti Michelia champaca atau Champa, juga dikenal sebagai tanaman hias yang populer di taman-taman dan pekarangan. Selain di Indonesia, bunga ini juga tersebar di negara-negara seperti India, Bangladesh, Vietnam, dan beberapa bagian China selatan. Bunga Michelia lebih suka tumbuh di daerah yang lembap dengan curah hujan tinggi, dan sering ditemukan pada ketinggian sekitar 1.000 hingga 2.000 meter di atas permukaan laut. Persebaran yang luas ini menjadikan Michelia sebagai bagian penting dari keanekaragaman hayati kawasan tropis.",
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
                      'Habitat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Bunga Michelia tumbuh di berbagai jenis habitat alami, terutama di kawasan hutan tropis dan subtropis. Bunga ini lebih menyukai tempat dengan iklim lembap dan curah hujan tinggi, yang menjadikannya sering ditemukan di daerah yang memiliki kelembapan udara yang tinggi. Habitat ideal bagi Michelia adalah di dataran rendah hingga pegunungan dengan ketinggian antara 1.000 hingga 2.000 meter di atas permukaan laut, meskipun beberapa spesies dapat tumbuh hingga ketinggian lebih tinggi. Di Indonesia, bunga ini sering ditemukan di hutan hujan tropis yang lebat, di pulau-pulau besar seperti Sumatra, Jawa, Kalimantan, dan Sulawesi. Selain itu, beberapa spesies Michelia juga bisa tumbuh di sepanjang tepi sungai atau daerah yang memiliki drainase baik. Karena kebutuhan terhadap kelembapan yang tinggi, bunga ini lebih jarang ditemukan di daerah yang memiliki iklim kering atau kurang mendapatkan sinar matahari langsung.",
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
                      'Ancaman Kepunahan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Bunga Michelia menghadapi beberapa ancaman yang dapat menyebabkan kepunahannya, terutama akibat kerusakan habitat yang disebabkan oleh deforestasi dan konversi lahan untuk pertanian atau pemukiman. Penggundulan hutan yang terjadi secara masif, terutama di kawasan tropis, mengurangi area alami yang menjadi tempat hidup bagi tanaman ini. Selain itu, perubahan iklim yang menyebabkan fluktuasi suhu dan curah hujan yang tidak menentu turut mengancam kelangsungan hidup bunga Michelia, terutama spesies yang tumbuh di ketinggian tertentu. Aktivitas perburuan liar dan pengambilan tanaman liar untuk perdagangan tanaman hias juga turut memberi tekanan pada populasi bunga Michelia di alam. Jika ancaman-ancaman ini tidak ditanggulangi dengan langkah konservasi yang tepat, bunga Michelia berisiko mengalami penurunan jumlah yang signifikan, bahkan bisa punah dari habitat aslinya. Oleh karena itu, penting untuk melestarikan habitat alaminya dan menerapkan kebijakan perlindungan tanaman langka ini.",
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
                      'Keunikan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Bunga Michelia memiliki berbagai keunikan yang membuatnya menarik baik dari segi estetika maupun ekologis. Salah satu keunikan utama bunga ini adalah aroma harum yang sangat khas, terutama pada spesies seperti Michelia champaca, yang dikenal dengan nama Champa. Aroma bunga yang manis dan kuat ini sering digunakan dalam pembuatan parfum dan produk kosmetik. Selain itu, bunga Michelia juga memiliki kelopak yang indah, berwarna cerah seperti kuning, putih, dan merah muda, yang membuatnya sangat diminati sebagai tanaman hias. Keunikan lainnya adalah sifatnya yang endemik, dengan beberapa spesies hanya ditemukan di wilayah tertentu, seperti di Indonesia dan Asia Tenggara, menjadikannya bagian dari kekayaan flora lokal yang sangat penting. Secara ekologi, bunga Michelia berperan dalam menarik serangga penyerbuk dan menjaga keseimbangan ekosistem hutan tropis. Keindahan dan keunikannya tidak hanya mempesona mata, tetapi juga memberikan nilai penting bagi keberagaman hayati dan budaya lokal.",
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
