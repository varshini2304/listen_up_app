import 'package:flutter/material.dart';
import 'onboarding/Screen1.dart';

void main() => runApp(const ListenUpApp());

class ListenUpApp extends StatelessWidget {
  const ListenUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListenUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SFPro'),   // optional custom font
      home: const Screen1(),
    );
  }
}
