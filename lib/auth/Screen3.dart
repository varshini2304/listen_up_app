import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Screen4.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  List<dynamic> recommendedBooks = [];
  List<dynamic> topFavorites = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    const String apiUrl =
        'https://www.googleapis.com/books/v1/volumes?q=subject:fiction&maxResults=6';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          recommendedBooks =
              data['items'].sublist(0, 3); // First 3 for recommended
          topFavorites =
              data['items'].sublist(3, 6); // Next 3 for top favorites
        });
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore your interests'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.grey[200],
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome To',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Text(
                    'BookCrafts',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Your stories, our passion',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ListenUp recommended for you',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  recommendedBooks.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: recommendedBooks.map((book) {
                            return _buildBookCard(
                              book['volumeInfo']['title'] ?? 'Unknown Title',
                              book['volumeInfo']['imageLinks']?['thumbnail'] ??
                                  '',
                              book,
                            );
                          }).toList(),
                        ),
                  const SizedBox(height: 20),
                  const Text(
                    'Top Favorites of our listeners this week',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  topFavorites.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: topFavorites.map((book) {
                            return _buildBookCard(
                              book['volumeInfo']['title'] ?? 'Unknown Title',
                              book['volumeInfo']['imageLinks']?['thumbnail'] ??
                                  '',
                              book,
                            );
                          }).toList(),
                        ),
                  const SizedBox(height: 10),
                  _buildBookCard(
                      'Featured by ListenUp', 'assets/book7.jpg', null),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.brown,
        onTap: (index) {},
      ),
    );
  }

  Widget _buildBookCard(String title, String imageUrl, dynamic book) {
    return GestureDetector(
      onTap: () {
        if (book != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Screen4(book: book),
            ),
          );
        }
      },
      child: Container(
        width: 100,
        child: Column(
          children: [
            imageUrl.isNotEmpty
                ? Image.network(
                    imageUrl,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 150),
                  )
                : Image.asset(
                    'assets/placeholder.jpg',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
