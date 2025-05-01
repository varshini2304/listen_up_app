import 'package:flutter/material.dart';
import 'credentials_signin.dart';

class WelcomeSign extends StatelessWidget {
  const WelcomeSign({super.key});

  static const _brown = Color(0xFFA04D00);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Image.asset('assets/login.png', height: 220),
              const SizedBox(height: 20),
              const Text('Ready to Dive In?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Sign In & let the stories begin!',
                  style: TextStyle(fontSize: 16, color: Colors.black54)),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: _brown, foregroundColor: Colors.white),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CredentialsSignIn()),
                  ),
                  child: const Text('Let’s get started!',
                      style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 24),
              const DividerWithText(text: 'OR'),
              const SizedBox(height: 20),
              SocialButton(
                  label: 'Sign in with Google', icon: Icons.g_mobiledata),
              const SizedBox(height: 12),
              SocialButton(label: 'Sign in with Apple', icon: Icons.apple),
              const SizedBox(height: 12),
              SocialButton(
                  label: 'Sign in with Facebook', icon: Icons.facebook),
              const Spacer(),
              Text.rich(TextSpan(
                text: "Don't have an account? ",
                children: [
                  TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                          color: _brown, fontWeight: FontWeight.w600))
                ],
              )),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;
  const DividerWithText({super.key, required this.text});
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(text, style: const TextStyle(color: Colors.black54)),
          ),
          const Expanded(child: Divider()),
        ],
      );
}

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  const SocialButton({super.key, required this.label, required this.icon});
  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton.icon(
          icon: Icon(icon, size: 20),
          label: Text(label),
          onPressed: () {},
        ),
      );
}
