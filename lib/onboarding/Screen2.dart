import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) => OnboardPage(
        headline: 'Turn Every Moment into a Story!',
        body:
            'Stuck in traffic? Hitting the gym? Unwinding at home? Let stories move with you. Press play and make every second count!',
        pageIndex: 1,
        onNext: () {
          // TODO: navigate to main app
        },
      );
}
