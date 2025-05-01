import 'package:flutter/material.dart';
import 'onboarding/splash.dart';

void main() => runApp(const ListenUpApp());

class ListenUpApp extends StatelessWidget {
  const ListenUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListenUp',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(), // start here
    );
  }
}
