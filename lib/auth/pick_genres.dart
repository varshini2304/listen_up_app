import 'package:flutter/material.dart';
import 'Screen3.dart';

class PickGenres extends StatefulWidget {
  const PickGenres({super.key});
  @override
  State<PickGenres> createState() => _PickGenresState();
}

class _PickGenresState extends State<PickGenres> {
  final List<String> _allGenres = [
    'Mystery',
    'Fantasy',
    'Fanfiction',
    'Historical Fiction',
    'Contemporary Lit',
    'Horror',
    'Romance',
    'Science Fiction',
    'Adventure',
    'Short story',
    'Humor',
    'Thriller',
  ];
  final Set<int> _selected = {};
  static const _brown = Color(0xFFA04D00);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Text('Hello!',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: _brown)),
                const SizedBox(height: 4),
                const Text(
                  'Pick up to 3 favorite genres, and we’ll match you with the perfect audiobooks! Sit back, relax, and let the stories begin!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: _allGenres.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) => _genreTile(i),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: _brown, foregroundColor: Colors.white),
                    onPressed: _selected.isEmpty
                        ? null
                        : () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Screen3()),
                            );
                          },
                    child: const Text('Save', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      );

  Widget _genreTile(int i) => GestureDetector(
        onTap: () {
          setState(() {
            if (_selected.contains(i)) {
              _selected.remove(i);
            } else if (_selected.length < 3) {
              _selected.add(i);
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: _selected.contains(i) ? _brown : Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Image.asset('assets/genre_thumbs/${i + 1}.png',
                  width: 80, height: 80, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Expanded(
                child:
                    Text(_allGenres[i], style: const TextStyle(fontSize: 16)),
              ),
              Checkbox(
                value: _selected.contains(i),
                activeColor: _brown,
                onChanged: (_) => setState(() {
                  if (_selected.contains(i)) {
                    _selected.remove(i);
                  } else if (_selected.length < 3) {
                    _selected.add(i);
                  }
                }),
              )
            ],
          ),
        ),
      );
}
