import 'package:flutter/material.dart';

const _brown = Color(0xFFA04D00);

class ListenUpTitle extends StatelessWidget {
  const ListenUpTitle({super.key});

  @override
  Widget build(BuildContext context) => const Text(
        'ListenUp',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      );
}

class Headline extends StatelessWidget {
  final String text;
  const Headline({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: _brown,
        ),
      );
}

class Body extends StatelessWidget {
  final String text;
  const Body({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          height: 1.35,
          color: Colors.black54,
        ),
      );
}

class Pagination extends StatelessWidget {
  final int index; // active page (0 or 1 here)
  const Pagination({super.key, required this.index});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          2,
          (i) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Dot(isActive: i == index),
          ),
        ),
      );
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) => Container(
        width: isActive ? 18 : 6,
        height: 6,
        decoration: BoxDecoration(
          color: Colors.grey[700],
          borderRadius: BorderRadius.circular(3),
        ),
      );
}

class BottomBar extends StatelessWidget {
  final VoidCallback onNext;
  const BottomBar({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {}, // TODO: handle skip
            child: const Text('Skip', style: TextStyle(color: _brown)),
          ),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: _brown,
              foregroundColor: Colors.white,
            ),
            child: const Text('Next'),
          ),
        ],
      );
}
