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
  List<dynamic> trendingBooks = [];
  List<dynamic> popularAuthors = [];
  String selectedGenre = 'Fiction';

  final List<String> genres = [
    'Fiction',
    'Mystery',
    'Romance',
    'Fantasy',
    'Science',
    'History',
    'Horror',
  ];

  @override
  void initState() {
    super.initState();
    fetchAllBooks();
  }

  Future<void> fetchAllBooks() async {
    final String apiUrl =
        'https://www.googleapis.com/books/v1/volumes?q=subject:$selectedGenre&maxResults=20';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final books = data['items'] ?? [];

        setState(() {
          recommendedBooks = books.take(5).toList();
          topFavorites = books.skip(5).take(5).toList();
          trendingBooks = books.skip(10).take(5).toList();
          popularAuthors = books.skip(15).take(5).toList();
        });
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print('Error fetching books: $e');
    }
  }

  void _onGenreSelected(String genre) {
    setState(() {
      selectedGenre = genre;
    });
    fetchAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Your Interests'),
        backgroundColor: Colors.brown,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Welcome Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.brown[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome To', style: TextStyle(fontSize: 16)),
                  Text(
                    'BookCrafts',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your stories, our passion',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Genre Filters
            const Text(
              'Genres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genres.length,
                itemBuilder: (context, index) {
                  final genre = genres[index];
                  return GestureDetector(
                    onTap: () => _onGenreSelected(genre),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedGenre == genre
                            ? Colors.brown
                            : Colors.brown[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          genre,
                          style: TextStyle(
                            color: selectedGenre == genre
                                ? Colors.white
                                : Colors.brown[800],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Section 1
            _buildSection("ListenUp recommended for you", recommendedBooks),

            // Section 2
            _buildSection(
                "Top Favorites of our listeners this week", topFavorites),

            // Section 3
            _buildSection("🔥 Trending Now", trendingBooks),

            // Section 4
            _buildSection("🌟 Popular Authors Picks", popularAuthors),
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

  Widget _buildSection(String title, List<dynamic> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        books.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: books.map((book) {
              final info = book['volumeInfo'];
              return _buildBookCard(
                info['title'] ?? 'Unknown Title',
                info['authors']?.join(', ') ?? 'Unknown Author',
                info['imageLinks']?['thumbnail'] ?? '',
                info['averageRating']?.toString() ?? 'N/A',
                book,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBookCard(String title, String author, String imageUrl,
      String rating, dynamic book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Screen4(book: book)),
        );
      },
      child: Container(
        width: 130,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                imageUrl,
                height: 150,
                width: 130,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, size: 130),
              )
                  : Image.asset(
                'assets/placeholder.jpg',
                height: 150,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 11),
            ),
            Text(
              'Rating: $rating',
              style: const TextStyle(color: Colors.orange, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
