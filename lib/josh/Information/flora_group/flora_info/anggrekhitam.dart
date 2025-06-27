import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:praktek2/josh/screen/bookmarkpage.dart';
import 'package:provider/provider.dart';

class AnggrekHitam extends StatefulWidget {
  const AnggrekHitam({super.key});

  @override
  _anggrekhitam createState() => _anggrekhitam();
}

class _anggrekhitam extends State<AnggrekHitam> {
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
          "Anggrek Hitam",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Anggrek Hitam");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Anggrek Hitam',
                  'image':
                      'https://tse3.mm.bing.net/th?id=OIP.1O6ZpvNXpPMeN54lXSmfagHaFf&w=351&h=351&c=7',
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
                  'https://tse3.mm.bing.net/th?id=OIP.1O6ZpvNXpPMeN54lXSmfagHaFf&w=351&h=351&c=7',
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
                            "Anggrek Hitam (Coelogyne pandurata) adalah spesies anggrek yang tumbuh di Semenanjung Malaya, Kalimantan, dan Sumatra.Angrek hitam adalah maskot flora Provinsi Kalimantan Timur. Saat ini,populasi Anggrek Hitam mengalami penurunan jumlah yang cukup besar, karena habitatnya semakin menyusut, seiring dengan areal hutan di Kalimantan makin sedikit.Saat ini Anggrek Hitam masih bisa ditemukan di Cagar Alam Kersik Luway dalam jumlah yang sedikit. Anggrek Hitam juga ditemukan di Taman Anggrek Hitam Selimbau di Kabupaten Kapuas Hulu, Kalimantan Barat.Selain itu, Anggrek Hitam juga bisa ditemukan di tangan para kolektor anggrek maupun petani.",
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
                      buildTextRow("Ordo", "Asparagales"),
                      buildTextRow("Family", "Orchidaceae"),
                      buildTextRow("Genus", "Coelogyne"),
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
                            "Persebaran bunga anggrek hitam (Coelogyne pandurata) terbatas dan endemik di wilayah Asia Tenggara, terutama di Indonesia dan Malaysia. Di Indonesia, anggrek hitam paling dikenal berasal dari Kalimantan, khususnya Kalimantan Timur, yang merupakan habitat utama tumbuhan ini. Selain itu, bunga ini juga dapat ditemukan di beberapa wilayah hutan hujan tropis di Sumatra dan Papua, meskipun dalam jumlah yang lebih sedikit. Di Malaysia, anggrek hitam tumbuh di daerah Sabah dan Sarawak di Pulau Kalimantan. Tumbuhan ini biasanya tumbuh menempel pada batang atau dahan pohon besar di hutan dataran rendah yang lembap dan memiliki intensitas cahaya yang rendah hingga sedang. Karena habitat aslinya terus mengalami tekanan akibat penebangan hutan dan alih fungsi lahan, keberadaan anggrek hitam di alam liar semakin langka dan memerlukan upaya konservasi yang serius.",
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
                            "Habitat bunga anggrek hitam (Coelogyne pandurata) berada di hutan hujan tropis yang lembap dan memiliki kondisi lingkungan yang sejuk serta teduh. Tumbuhan ini tumbuh secara epifit, yaitu menempel pada batang atau cabang pohon besar tanpa merusak pohon inangnya, dan menyerap kelembapan serta nutrisi dari udara dan sisa-sisa organik di sekitarnya. Anggrek hitam biasanya ditemukan di dataran rendah hingga daerah pegunungan dengan ketinggian sekitar 400-600 meter di atas permukaan laut. Ia menyukai tempat dengan kelembapan tinggi, sirkulasi udara yang baik, dan intensitas cahaya matahari yang tidak langsung. Habitat seperti ini banyak dijumpai di hutan-hutan tropis Kalimantan, terutama di Kalimantan Timur, yang merupakan salah satu daerah persebaran utama anggrek hitam. Namun, perubahan fungsi lahan dan kerusakan hutan menjadi ancaman serius bagi kelestarian habitat alami bunga yang unik ini.",
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
                            "Anggrek hitam menghadapi ancaman kepunahan yang cukup serius akibat berbagai faktor, terutama aktivitas manusia yang merusak habitat alaminya. Penebangan hutan secara liar, alih fungsi lahan untuk perkebunan dan pemukiman, serta eksploitasi berlebihan untuk kepentingan komersial menjadi penyebab utama menurunnya populasi anggrek hitam di alam liar. Karena anggrek ini memiliki nilai estetika dan ekonomi yang tinggi, banyak yang memburunya tanpa memperhatikan keberlanjutan atau upaya pelestarian. Selain itu, perubahan iklim yang menyebabkan terganggunya kelembapan dan kestabilan suhu di habitat aslinya juga turut memperburuk situasi. Proses pertumbuhan anggrek hitam yang lambat dan ketergantungannya pada kondisi lingkungan yang sangat spesifik membuatnya sulit untuk berkembang di luar habitat alami. Jika tidak ada tindakan nyata dalam bentuk konservasi dan perlindungan habitat, anggrek hitam berisiko punah dan hanya akan dikenal sebagai bagian dari kekayaan hayati masa lalu.",
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
                            "Keunikan anggrek hitam (Coelogyne pandurata) terletak pada bentuk dan warna bunganya yang sangat khas dan memikat. Bunga ini memiliki kelopak berwarna hijau dengan corak bibir berwarna hitam legam atau kehitaman, yang menjadi ciri khas dan alasan utama pemberian nama “anggrek hitam.” Kombinasi warna yang kontras ini menjadikannya sangat menarik dan berbeda dari jenis anggrek lainnya. Selain warnanya yang unik, bunga anggrek hitam juga mengeluarkan aroma harum yang lembut, terutama saat mekar penuh. Bunga ini biasanya mekar pada musim-musim tertentu dan hanya bertahan selama beberapa hari, menjadikannya semakin istimewa dan langka. Tumbuh secara epifit di pohon-pohon besar hutan tropis, anggrek hitam juga menunjukkan kemampuan beradaptasi yang luar biasa dalam lingkungan dengan kelembapan tinggi dan cahaya matahari tidak langsung. Keindahan dan keunikan tersebut membuat anggrek hitam menjadi salah satu tanaman hias yang sangat dihargai dan menjadi simbol kekayaan hayati Kalimantan.",
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
