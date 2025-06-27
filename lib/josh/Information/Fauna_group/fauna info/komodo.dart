import 'package:flutter/material.dart';
import 'package:praktek2/josh/Provider/Bookmarkpro.dart';
import 'package:praktek2/josh/screen/navigation.dart';
import 'package:provider/provider.dart';

class Komodo extends StatefulWidget {
  const Komodo({super.key});

  @override
  _komodo createState() => _komodo();
}

class _komodo extends State<Komodo> {
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
        title: Text("Komodo", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        actions: [
          Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
            final isBookmarked = bookmarkProvider.isBookmarked("Komodo");

            return IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.yellow,
              ),
              onPressed: () {
                bookmarkProvider.toggleBookmark({
                  'title': 'Komodo',
                  'image':
                      'https://tse3.mm.bing.net/th?id=OIP.j3b528L7v1t0V25Z7uC1agHaE9&w=317&h=317&c=7',
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
                  'https://tse3.mm.bing.net/th?id=OIP.j3b528L7v1t0V25Z7uC1agHaE9&w=317&h=317&c=7',
                  height: 300,
                  width: 600,
                ),
              ),
              SizedBox(height: 10),
              buildSectionTitle("Pengenalan"),
              buildParagraph(
                "Komodo atau lengkapnya biawak komodo (Varanus komodoensis), adalah spesies biawak besar..."
                "Sekarang, habitat komodo yang sesungguhnya telah menyusut akibat aktivitas manusia...",
              ),
              buildDataSection(),
              buildSectionTitle("Status Kelangkaan"),
              buildParagraph(
                "Komodo sekarang terancam punah menurut International Union for Conservation of Nature (IUCN)...",
              ),
              buildImageSection(
                  "https://assets.promediateknologi.id/crop/0x0:0x0/0x0/webp/photo/p3/66/2024/05/25/FotoJet-2024-05-25T184047425-2227825778.jpg"),
              buildSectionTitle("Habitat"),
              buildParagraph(
                "Habitat komodo (Varanus komodoensis) terbatas pada beberapa pulau di Indonesia...",
              ),
              buildSectionTitle("Makanan"),
              buildParagraph(
                "Komodo adalah pemangsa karnivora... mereka juga tidak ragu untuk memakan sisa-sisa mangsa...",
              ),
              buildSectionTitle("Ancaman Kepunahan"),
              buildParagraph(
                "Komodo menghadapi ancaman kepunahan yang signifikan... mereka sangat rentan terhadap bencana alam...",
              ),
              SizedBox(height: 30),
              buildCommentInput(),
              buildCommentList(),
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

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildParagraph(String content) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 15),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget buildDataSection() {
    return Padding(
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
            buildTextRow("Kerajaan", "Animalia"),
            buildTextRow("Ordo", "Squamata"),
            buildTextRow("Family", "Varanidae"),
            buildTextRow("Genus", "Varanus"),
          ],
        ),
      ),
    );
  }

  Widget buildImageSection(String url) {
    return Column(
      children: [
        Center(
          child: Image.network(url, width: 800, height: 300),
        ),
      ],
    );
  }

  Widget buildCommentInput() {
    return TextField(
      controller: _commentController,
      decoration: InputDecoration(
        hintText: "Tambahkan komentar...",
        suffixIcon: IconButton(
          icon: Icon(Icons.send, color: Colors.green),
          onPressed: _addComment,
        ),
      ),
    );
  }

  Widget buildCommentList() {
    return ListView.builder(
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
    );
  }
}
