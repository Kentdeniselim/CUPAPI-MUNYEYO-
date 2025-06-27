import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Elangjawa extends StatefulWidget {
  const Elangjawa({super.key});

  @override
  _ElangjawaState createState() => _ElangjawaState();
}

class _ElangjawaState extends State<Elangjawa> {
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
          "Elang Jawa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Elang Jawa");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Elang Jawa',
                  'image':
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/ELJA.jpg/330px-ELJA.jpg',
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
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/ELJA.jpg/330px-ELJA.jpg',
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
                            "Burung elang adalah salah satu predator teratas dalam sistem rantai makanan, termasuk juga Elang Jawa. Burung yang menjadi simbol kebebasan di tanah Jawa ini memiliki postur gagah dan bentangan sayap yang elok. Elang Jawa juga mempunyai penglihatan tajam yang membantu mengamati mangsa buruan dari atas ketinggian.",
                        style: TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text:
                                "Satwa endemik dari Jawa ini adalah burung karnivora yang dianggap sebagai Garuda, yaitu burung lambag negara Indonesia. Selain itu, ia juga menjasi maskot satwa langka Indonesia yang wajib dilindungi dan dilestarikan.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
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
                      Text(
                        "Taksonomi",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      buildTextRow("Kingdom", "Animalia"),
                      buildTextRow("Filum", "Chordata"),
                      buildTextRow("Kelas", "Aves"),
                      buildTextRow("Ordo", "Accipitriformes"),
                      buildTextRow("Famili", "Accipitridae"),
                      buildTextRow("Genus", "Nisaetus", isItalic: true),
                      buildTextRow("Spesies", "Nisaetus bartelsi",
                          isItalic: true),
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
                      'Sebaran di pulau jawa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Jawa Tengah : Gunung Slamet, Gunung Ungaran, Gunung Muria, Gunung Lawu, Gunung Merapi,",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Jawa Timur : Merubetiri, Baluran, Alas Purwo,Taman Nasional Bromo, Tengger, Semeru, Wilis",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Jawa Barat : Gunung Pancar, Gunung Salak, TN Gunung Gede Pangrango, Papandayan, Patuha, Gunung Halimun",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                      child: Image.network(
                    "https://tse4.mm.bing.net/th?id=OIP.4OxdCgIT-w1qE4bFRebGBAHaEO&pid=Api&P=0&h=220",
                    width: 800,
                    height: 300,
                  ))
                ],
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
                            "Burung ini diberi nama Elang Jawa karena hanya ditemukan di Pulau Jawa. Habitat Elang Jawa adalah di kawasan hutan dataran rendah, yaitu sebagai wilayah bersarang maupun berburu mangsa. Area sarang burung elang merupakan daerah teritorinya, hal ini disebabkan oleh melimpahnya sumber pakan seperti fauna-fauna kecil sebagai mangsa utamanya.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Biasanya burung elang akan membuat sarang pada pohon yang berada di ketinggian 1.100 mdpl dengan topografi curam, seperti lereng tebih atau gunung, dekat dengan sumber air atau sungai, serta berjarak sekitar 500 meter dengan wilayah terbuka.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sarang burung akan diletakkan di ketinggian 16 meter pada pohon saninten (Castanopsis argentea), pohon rasamala (Altingia excelsa), pasang (Lithocarpus sundaicus), pohon tusam (Pinus merkusii), puspa (Schima wallichii), dan ki sireum (Eugenia clavimyrtus) dengan tinggi lebih dari 30 meter dan ditumbuhi banyak liana.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Selain di hutan alam dataran rendah, kita juga menjumpai burung ini di wilayah hutan primer dan perbukitan peralihan kawasan dataran rendah dan pegunungan. Sehingga dapat disimpulkan, secara umum habitat Elang Jawa adalah di daerah hutan hujan tropis.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Akan tetapi, tentu tidak mudah menemukan burung ini. Karena jumlahnya di alam sudah banyak berkurang akibat rusaknya habitat alami, deforestasi, perburuan maupun dampak pemanasan global.",
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
                      'Ancaman kepunahan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Populasi Elang Jawa di alam mengalami ancaman kepunahan yang sangat serius. Jumlahnya diperkirakan sekitar 300 sampai 500 ekor. Padahal burung ini mempunyai peran penting dalam menjaga keseimbangan ekosistem, sebab ia merupakan pemangsa puncak dalam rantai dan piramida makanan. Jika predator ini jumlah terus menurun, maka satwa-satwa di tingkatan bawahnya akan mengalami lonjakan populasi.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Elang Jawa masuk ke dalam satwa dengan prioritas konservasi menurut Permenhut No 57 Tahun 2008 dan Keputusan Dirjen PHKA No 132 Tahun 2011 dan No 109 Tahun 2012, yaitu sebagai 14 spesies prioritas utama.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "IUCN atau (International Union for Conservation of Nature and Natural Resources) ",
                        style: TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text:
                                "juga memasukkan burung ini ke dalam kategori ",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: "endangered. ",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15),
                          ),
                          TextSpan(
                            text:
                                "CITES (Conservation on International Trade in Endangered) ",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: "endangered.",
                            style: TextStyle(
                                fontStyle: FontStyle.italic, fontSize: 15),
                          ),
                          TextSpan(
                            text:
                                "menggolongkannya pada Appendix I karena rusaknya habitat hutan, perburuan liar dan perdagangan ilegal.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Makanan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Burung ini merupakan satwa endemik Jawa pemakan daging alias karnivora yang biasa memangsa hewan kecil. Mencakup hewan reptil seperti kadal, pengerat (tikus, bajing, tupai), unggas (burung, ayam kampung) hingga mamalia seperti kalong, musang, atau anak monyet.",
                        style: TextStyle(fontSize: 15),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
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
