import 'package:flutter/material.dart';
import 'widgets.dart';

/// Re‑usable layout used by every onboarding screen.
class OnboardPage extends StatelessWidget {
  final String headline;
  final String body;
  final int pageIndex; // 0‑based
  final VoidCallback onNext;

  const OnboardPage({
    super.key,
    required this.headline,
    required this.body,
    required this.pageIndex,
    required this.onNext,
  });

  static const _peach = Color(0xFFFFF1E9);
  static const _hPadding = 28.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: _peach,
          padding: const EdgeInsets.symmetric(horizontal: _hPadding),
          child: Column(
            children: [
              const SizedBox(height: 24),
              const ListenUpTitle(),
              const SizedBox(height: 24),
              Headline(text: headline),
              const SizedBox(height: 12),
              Body(text: body),
              const SizedBox(height: 24),
              Pagination(index: pageIndex),
              const Spacer(),
              Image.asset('assets/main_bg.png', height: 260),
              const SizedBox(height: 48),
              BottomBar(onNext: onNext),
            ],
          ),
        ),
      ),
    );
  }
}
