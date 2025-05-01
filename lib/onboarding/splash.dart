import 'package:flutter/material.dart';
import 'Screen1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Simulate loading (API, prefs, etc.)
    Future.delayed(const Duration(seconds: 4), _goNext);
  }

  void _goNext() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Screen1()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const peach = Color(0xFFFFF1E9);

    return Scaffold(
      backgroundColor: peach,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'ListenUp',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Every Story, Every Voice, Anytime.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
            // Optional bottom indicator bar mimic
            const Align(
              alignment: Alignment(0, 0.9),
              child: SizedBox(
                width: 140,
                height: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
