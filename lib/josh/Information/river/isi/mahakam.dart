import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/Provider/navigation.dart';
import 'package:provider/provider.dart';

class Mahakam extends StatefulWidget {
  const Mahakam({super.key});

  @override
  _sungaimahakam createState() => _sungaimahakam();
}

class _sungaimahakam extends State<Mahakam> {
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
          "Sungai Mahakam",
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
                bookmarkProvider.isBookmarked("Sungai Mahakam");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Sungai Mahakam',
                  'image':
                      'https://tse3.mm.bing.net/th?id=OIP.z0g5ZB2Rh5vi7rO1TG8eFwHaE8&w=316&h=316&c=7',
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
                  'https://tse3.mm.bing.net/th?id=OIP.z0g5ZB2Rh5vi7rO1TG8eFwHaE8&w=316&h=316&c=7',
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
                            "Sungai Mahakam adalah sungai terbesar di Kalimantan Timur , Indonesia, dengan daerah tangkapan air sekitar 77.100 km 2 . Daerah tangkapan air terletak antara 2˚ LU hingga 1˚ LS dan 113˚ BT hingga 118˚ BT. Sungai ini berhulu di Cemaru dan mengalir ke arah tenggara, bertemu dengan Sungai Kedang Pahu di kota Muara Pahu . Dari sana, sungai mengalir ke arah timur melalui wilayah danau Mahakam , yang merupakan daerah dataran rendah tropis yang dikelilingi oleh lahan gambut. Tiga puluh danau dangkal terletak di daerah ini, yang terhubung ke Mahakam melalui saluran kecil. Di hilir hubungan dengan danau Semayang dan Melintang, Mahakam bertemu dengan tiga anak sungai utama lainnya sungai Belayan , Kedang Kepala , dan Kedang Rantau dan mengalir ke arah tenggara melalui anak-anak sungai delta Mahakam, ke Selat Makassar .",
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
                      buildTextRow("Panjang", "920 KM"),
                      buildTextRow("Mata Air", "-"),
                      buildTextRow("Provinsi", "Kalimantan Timur"),
                      buildTextRow("Hilir", "Selat Makasar"),
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
                      'Sumber',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sumber dari Sungai Mahakam berada di Pegunungan Müller, yang terletak di perbatasan antara Kalimantan Timur dan Kalimantan Tengah. Pegunungan ini merupakan bagian dari pegunungan di pedalaman Pulau Kalimantan yang juga menjadi hulu dari beberapa sungai besar lainnya di pulau tersebut."
                            "Dari Pegunungan Müller, Sungai Mahakam mengalir ke timur melintasi hutan tropis, daerah rawa, danau-danau besar seperti Danau Jempang, Danau Semayang, dan Danau Melintang, sebelum akhirnya bermuara ke Selat Makassar di kawasan pesisir timur Kalimantan, tepatnya di wilayah Kabupaten Kutai Kartanegara.",
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
                            "Kedalaman Sungai Mahakam bervariasi tergantung pada lokasi dan musim. Secara umum, kedalaman rata-ratanya berkisar antara 10 hingga 30 meter. Di bagian hulu sungai, kedalamannya cenderung lebih dangkal, terutama saat musim kemarau, sedangkan di bagian hilir, khususnya di sekitar muara dan Kota Samarinda, kedalaman bisa mencapai hingga 40 meter di beberapa titik. Selain itu, danau-danau besar yang terhubung dengan Sungai Mahakam, seperti Danau Semayang dan Danau Melintang, memiliki kedalaman sekitar 5 hingga 15 meter. Perubahan kedalaman ini juga dipengaruhi oleh faktor-faktor seperti sedimentasi dan aktivitas manusia, termasuk pertambangan serta penebangan hutan di daerah sekitar aliran sungai.",
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
                      'Ekonomi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Mahakam memiliki peran yang sangat penting dalam mendukung perekonomian di Kalimantan Timur. Sungai ini menjadi jalur transportasi utama untuk pengangkutan berbagai komoditas, terutama hasil tambang seperti batu bara dan hasil hutan seperti kayu. Selain itu, Sungai Mahakam juga menjadi sumber penghidupan bagi masyarakat lokal melalui sektor perikanan, baik penangkapan ikan tradisional maupun budidaya ikan di keramba. Sungai ini turut mendukung aktivitas pertanian dengan menyediakan air irigasi bagi lahan-lahan di sekitarnya. Dalam sektor pariwisata, Sungai Mahakam menjadi daya tarik wisata budaya dan alam, seperti wisata susur sungai dan kunjungan ke desa-desa Dayak. Dengan fungsinya yang beragam, Sungai Mahakam menjadi tulang punggung ekonomi bagi kota-kota dan kabupaten yang dilaluinya.",
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
                      'Keanekaragaman Hayati',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Mahakam memiliki keanekaragaman hayati yang sangat kaya dan menjadi salah satu ekosistem air tawar terpenting di Indonesia. Sungai ini merupakan habitat dari berbagai spesies ikan seperti belida, baung, patin, toman, dan lais yang menjadi sumber pangan dan mata pencaharian masyarakat setempat. Salah satu satwa paling langka yang hidup di sungai ini adalah Pesut Mahakam (Orcaella brevirostris), sejenis lumba-lumba air tawar yang sangat terancam punah dan hanya ditemukan di beberapa lokasi di dunia. Selain itu, kawasan sekitar sungai juga menjadi tempat tinggal bagi berbagai jenis burung air seperti bangau, cangak, dan bebek liar. Sungai Mahakam terhubung dengan beberapa danau besar seperti Danau Semayang, Melintang, dan Jempang yang memperkaya keragaman ekosistem perairan. Hutan rawa dan lahan basah di sekitar sungai turut menunjang kehidupan flora dan fauna yang unik dan menjadikan kawasan ini penting untuk konservasi keanekaragaman hayati.",
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
                      'Ancaman Polusi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text:
                            "Sungai Mahakam menghadapi berbagai ancaman polusi yang dapat merusak ekosistem dan kualitas airnya. Salah satu sumber polusi terbesar berasal dari limbah industri, terutama dari tambang batu bara, minyak, dan kegiatan pemrosesan kayu yang mencemari air dengan bahan kimia berbahaya dan logam berat. Selain itu, sampah rumah tangga yang dibuang sembarangan oleh pemukiman di sepanjang sungai juga turut memperburuk kualitas air, menyebabkan pencemaran plastik dan bahan organik lainnya. Aktivitas pertanian yang tidak ramah lingkungan, seperti penggunaan pestisida dan pupuk kimia, juga menyumbang pada pencemaran air. Selain itu, sedimentasi akibat deforestasi dan pembukaan lahan turut mempercepat pendangkalan sungai dan merusak habitat bagi banyak spesies. Polusi ini tidak hanya membahayakan kehidupan biota di dalam sungai, tetapi juga mengancam keberlanjutan sumber daya alam yang bergantung pada sungai tersebut, termasuk kehidupan masyarakat yang bergantung pada perikanan dan pertanian.",
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
