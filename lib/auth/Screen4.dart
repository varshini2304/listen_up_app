import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final dynamic book;
  Screen4({required this.book});

  @override
  Widget build(BuildContext context) {
    final volumeInfo = book['volumeInfo'];
    final title = volumeInfo['title'] ?? 'Unknown Title';
    final authors = volumeInfo['authors']?.join(', ') ?? 'Unknown Author';
    final description =
        volumeInfo['description'] ?? 'No description available.';
    final imageUrl = volumeInfo['imageLinks']?['thumbnail'] ?? '';

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Ebook: $title'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        height: 300,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image, size: 300),
                      )
                    : Image.asset(
                        'assets/placeholder.jpg',
                        height: 300,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[200]),
                  child: const Text('Listen Up Now'),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.brown)),
                  child: const Text('Add To Listen Up List',
                      style: TextStyle(color: Colors.brown)),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text('Ratings from our readers: ',
                      style: TextStyle(fontSize: 16)),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Icon(Icons.star_border, color: Colors.amber, size: 16),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'About the Book:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                description,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                'Know about the author:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                'Author: $authors',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
