import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class JalakBali extends StatefulWidget {
  const JalakBali({super.key});

  @override
  _jalakbali createState() => _jalakbali();
}

class _jalakbali extends State<JalakBali> {
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
          "Jalak Bali",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Jalak Bali");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Jalak Bali',
                  'image':
                      'https://tse4.mm.bing.net/th?id=OIP.qs7ZpL5fOo9QL43mqGFk4QHaFj&w=355&h=355&c=7',
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
                  'https://tse4.mm.bing.net/th?id=OIP.qs7ZpL5fOo9QL43mqGFk4QHaFj&w=355&h=355&c=7',
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
                            "Jalak Bali (Leucopsar rothschildi) adalah sejenis burung pengicau berukuran sedang, dengan panjang lebih kurang 25 cm, dari suku Sturnidae. Ia turut dikenali sebagai Curik Ketimbang Jalak. Jalak Bali hanya ditemukan di hutan bagian barat Pulau Bali dan merupakan hewan endemik Indonesia. Burung ini juga merupakan satu-satunya spesies endemik Bali dan pada tahun 1991 dinobatkan sebagai lambang fauna Provinsi Bali.Jalak Bali ditemukan pertama kali pada tahun 1910. Nama ilmiah Jalak Bali dinamakan menurut pakar hewan berkebangsaan Inggris, Walter Rothschild, sebagai orang pertama yang mendeskripsikan spesies ini ke dunia pengetahuan pada tahun 1912.",
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
                      buildTextRow("Kerajaan", "Animalia"),
                      buildTextRow("Ordo", "Passeriformes"),
                      buildTextRow("Family", "Sturnidae"),
                      buildTextRow("Genus", "Leucopsar"),
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
                      'Status Kelangkaan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Jalak Bali saat ini masih tergolong sebagai spesies yang terancam punah di alam liar, namun populasinya sedang meningkat berkat upaya konservasi dan penangkaran. Meskipun demikian, masih terdapat ancaman terhadap kelestarian jalak Bali, seperti perusakan habitat dan perburuan liar.",
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
                            "Habitat jalak Bali (Leucopsar rothschildi) terbatas di Pulau Bali, Indonesia, terutama di daerah pesisir dan hutan-hutan kering di bagian barat daya pulau ini. Dulunya, jalak Bali dapat ditemukan di berbagai kawasan hutan tropis yang terbuka, namun sekarang mereka lebih sering ditemukan di kawasan yang telah terfragmentasi akibat konversi lahan untuk pertanian dan pemukiman. Jalak Bali lebih menyukai daerah dengan vegetasi semak belukar atau hutan dataran rendah yang tidak terlalu rapat, serta daerah yang memiliki akses ke sumber air bersih. Seiring dengan berkurangnya hutan alami, populasi jalak Bali semakin terbatas dan kini mereka juga ditemukan di beberapa taman nasional dan kawasan konservasi yang dilindungi. Kehidupan jalak Bali yang terancam oleh kehilangan habitat alami membuat upaya perlindungan dan konservasi sangat penting untuk menjaga kelangsungan hidup spesies yang terancam punah ini.",
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
                      'Makanan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Jalak Bali (Leucopsar rothschildi) adalah burung omnivora yang memiliki pola makan yang cukup bervariasi, tergantung pada ketersediaan makanan di habitatnya. Secara alami, jalak Bali mengonsumsi berbagai jenis makanan, mulai dari buah-buahan, biji-bijian, hingga serangga kecil. Mereka juga diketahui memakan nektar dari bunga dan beberapa jenis tumbuhan lain yang dapat mereka akses di lingkungan sekitar. Di alam liar, makanan utama jalak Bali termasuk buah-buahan seperti pisang, pepaya, dan buah-buahan kecil lainnya, serta biji-bijian seperti jagung dan biji rumput. Selain itu, mereka juga memakan serangga seperti cacing, semut, dan serangga kecil lainnya untuk mencukupi kebutuhan protein mereka. Dalam perawatan di penangkaran, jalak Bali diberi makan campuran buah-buahan, sayuran, dan makanan tambahan berupa pakan burung komersial untuk memastikan asupan nutrisi yang cukup.",
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
                            "Jalak Bali (Leucopsar rothschildi) menghadapi ancaman kepunahan yang sangat serius, terutama akibat kehilangan habitat alami dan perdagangan ilegal. Kehilangan hutan dan perubahan penggunaan lahan di Pulau Bali, yang merupakan satu-satunya habitat alami jalak Bali, telah mengurangi ruang hidup burung ini secara signifikan. Selain itu, jalak Bali juga sering menjadi sasaran perdagangan ilegal burung hias, di mana mereka ditangkap dan dijual untuk koleksi. Aktivitas ini menyebabkan penurunan jumlah populasi yang drastis di alam liar. Perburuan liar, bersama dengan fragmentasi habitat yang semakin parah, memperburuk keadaan, dan menyebabkan spesies ini terancam punah di habitat aslinya. Meskipun upaya konservasi dan penangkaran di beberapa tempat telah dilakukan, namun populasi jalak Bali di alam liar tetap sangat terbatas, sehingga diperlukan tindakan perlindungan yang lebih intensif agar spesies ini tidak hilang selamanya.",
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
