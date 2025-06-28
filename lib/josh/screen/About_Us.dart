import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(Icons.forest, size: 100, color: Colors.green),
            ),
            const SizedBox(height: 20),
            const Text(
              '🌿 RimbaFamily',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'RimbaFamily adalah aplikasi edukatif yang dirancang untuk memperkenalkan dunia flora, fauna, dan alam liar kepada pengguna dari segala usia. '
              'Terinspirasi dari kekayaan alam Indonesia dan dunia, aplikasi ini menyatukan informasi menarik, fitur interaktif, serta tampilan yang ramah pengguna '
              'untuk menjelajahi kehidupan di darat, air, dan udara.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '🌱 Visi Kami:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              '“Menumbuhkan kecintaan dan kesadaran terhadap alam semesta melalui teknologi dan edukasi.”',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              '🦁 Fitur Unggulan:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            bulletPoint('Informasi lengkap tentang hewan dan tumbuhan'),
            bulletPoint('Kategori: Darat, Udara, dan Air'),
            bulletPoint('Bookmark halaman favorit'),
            bulletPoint('Tema personalisasi & waktu nyata'),
            bulletPoint('Tampilan interaktif dan modern'),
            const SizedBox(height: 20),
            const Text(
              '📫 Hubungi Kami:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Jika kamu memiliki saran, pertanyaan, atau ingin berkontribusi, hubungi kami di:\n'
              '📧 rimbafamily@mikroskil.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  static Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: Colors.green, size: 20),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
