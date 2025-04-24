import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'screen2.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) => OnboardPage(
        headline: 'Hear the Story, Feel the Magic!',
        body:
            'No time to read? No problem. Stream, download, and escape into epic audiobooks—whenever, wherever. Your next adventure is just a tap away!',
        pageIndex: 0,
        onNext: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const Screen2()),
        ),
      );
}
