import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Harimausumatera extends StatefulWidget {
  const Harimausumatera({super.key});

  @override
  _HarimausumateraState createState() => _HarimausumateraState();
}

class _HarimausumateraState extends State<Harimausumatera> {
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
          "Harimau Sumatera",
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
                bookmarkProvider.isBookmarked("Harimau Sumatera");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Harimau Sumatera',
                  'image':
                      'https://4.bp.blogspot.com/-V8RD_wzCRQs/V5Rlbo80txI/AAAAAAAACGo/rliY7NowA74d1rhKR3QWQ0aldBscP_LJQCLcB/s1600/Gambar-harimau-9.JPG',
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
                  'https://4.bp.blogspot.com/-V8RD_wzCRQs/V5Rlbo80txI/AAAAAAAACGo/rliY7NowA74d1rhKR3QWQ0aldBscP_LJQCLcB/s1600/Gambar-harimau-9.JPG',
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
                            "Ada enam sub-spesies harimau di dunia yang masih mampu bertahan hidup hingga sekarang. Satu di antara keenam sub-spesies tersebut hidup di daratan Pulau Sumatera dan dikenal dengan nama Harimau Sumatera. Akan tetapi keberadaan satwa liar ini sudah mulai langka dan dalam kondisi terancam di alam akibat berbagai faktor. Status Harimau Sumatera kini masuk dalam kelompok satwa kritis yang terancam punah oleh ",
                        style: TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text:
                                "IUCN (International Union for Conservation of Nature)",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text:
                                ". Padahal keberadaannya sangat berarti bagi kesinambungan rantai makanan, karena menempati posisi predator puncak. Maka dari itu banyak pihak dan pegiat sosial yang mulai melakukan upaya konservasi untuk mempertahankan populasi harimau ini.",
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
                      SizedBox(height: 10),
                      buildTextRow("Kingdom", "Animalia"),
                      buildTextRow("Filum", "Chordata"),
                      buildTextRow("Kelas", "Mamalia"),
                      buildTextRow("Ordo", "Carnivora"),
                      buildTextRow(
                        "Spesies",
                        "Panthera tigris",
                        isItalic: true,
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
                      'Status Kelangkahan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Telah disebutkan bahwa status Harimau Sumatera saat ini adalah kritis dan terancam punah. Hal itu dinyatakan oleh",
                        style: TextStyle(fontSize: 15),
                        children: [
                          TextSpan(
                            text:
                                "red list International Union for Conservation of Nature (IUCN)",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text: "jika satwa liar ini berstatus",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: "Critically Endangered (CE) ",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text:
                                "yang berarti resiko kepunahannya sangat tinggi dan bahkan diperkirakan punah dalam waktu dekat.",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
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
                            "Harimau Sumatera pada dasarnya dapat hidup pada berbagai kondisi habitat, selama lingkungan tersebut memiliki pasokan makanan memadai, mampu memberi perlindungan, cukup air dan sinar matahari. Umumnya satwa ini dijumpai pada kawasan hutan dengan ketinggian sekitar 0 sampai 2.000 meter di atas permukaan laut (dpl).",
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
                            "Adapun kawasan yang menjadi habitat favorit kucing Sumatera adalah hutan hujan tropis seperti hutan rawa, hutan bersungai, semak belukar, padang rumput, hingga alang-alang. Tipe-tipe hutan seperti itu dapat memenuhi kebutuhan makan, perlindungan, sekaligus untuk berkembangbiak.",
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
                            "Sebagai satwa soliter, Harimau Sumatera juga mempunyai area teritori yang harus dipertahankan seperti sarang dan tempat untuk tidur. Cara untuk menandai sekaligus mempertahankan teritorinya adalah meninggalkan tanda berupa cakaran dan bau urin serta feses.",
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
                            "Selain soliter, harimau ini juga senang menjelajah untuk memenuhi kehidupannya. Jangkauan jelajah tergantung pada kemampuan tubuhnya, ketersediaan kebutuhan hidup, dan tipe habitat yang ditinggali. Harimau jantan biasanya sanggup menjelajah tiga kali lebih jauh dibanding harimau betina.",
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
                            "Harimau Sumatera adalah kelompok satwa karnivora yang memakan daging dan memerlukan makanan sebanyak seperlima dari bobot tubuhnya. Satwa ini biasanya akan melakukan perburuan pada waktu malam secara individual dengan bersembunyi, mengejar, kemudian menerkam dan memakan binatang buruannya.",
                        style: TextStyle(fontSize: 15),
                      ),
                      textAlign: TextAlign.left,
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
                            "Keberadaan gigi dan cakar yang sangat tajam menjadi poin utama yang membantu harimau agar bisa lebih cepat membunuh mangsanya. Beberapa jenis binatang yang menjadi buruan harimau antara lain babi hutan, kijang, tapir, rusa, monyet ekor panjang, ular, biawal, landak, dan masih banyak lagi.",
                        style: TextStyle(fontSize: 15),
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
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Dalam sehari Harimau Sumatera sanggup melakukan perburuan sebanyak tiga sampai enam kali. Setelah mendapat buruannya satwa ini biasanya hanya akan memakan 70% dari tubuh mangsanya. Kemudian sisanya akan disimpan untuk dimakan kembali dengan cara menutupnya menggunakan dedaunan dan ranting.",
                        style: TextStyle(fontSize: 15),
                      ),
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
