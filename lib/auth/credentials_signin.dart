import 'package:flutter/material.dart';
import 'package:flutterapp1/auth/welcome_sign.dart';
import 'pick_genres.dart';

class CredentialsSignIn extends StatefulWidget {
  const CredentialsSignIn({super.key});
  @override
  State<CredentialsSignIn> createState() => _CredentialsSignInState();
}

class _CredentialsSignInState extends State<CredentialsSignIn>
    with SingleTickerProviderStateMixin {
  late final TabController _tab = TabController(length: 2, vsync: this);
  bool remember = false;
  static const _brown = Color(0xFFA04D00);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                const SizedBox(height: 8),
                IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context)),
                const SizedBox(height: 4),
                const Text('Sign In',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text("Let's sign in with your ListenUp account!",
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 24),
                TabBar(
                  controller: _tab,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black87,
                  indicator: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(6)),
                  tabs: const [
                    Tab(text: 'Email'),
                    Tab(text: 'Phone Number'),
                  ],
                ),
                const SizedBox(height: 16),
                if (_tab.index == 0) _emailFields() else _phoneFields(),
              ],
            ),
          ),
        ),
      );

  Widget _emailFields() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputField(hint: 'nathancaldwill@gmail.com', icon: Icons.mail),
          const SizedBox(height: 16),
          _inputField(hint: 'Password', icon: Icons.lock, obscure: true),
          const SizedBox(height: 6),
          Row(
            children: [
              Checkbox(
                  value: remember,
                  activeColor: _brown,
                  onChanged: (v) => setState(() => remember = v ?? false)),
              const Text('Remember me?'),
              const Spacer(),
              Text('Forgot password?',
                  style: TextStyle(color: _brown, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: _brown, foregroundColor: Colors.white),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PickGenres()),
              ),
              child: const Text('Get Started!', style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 32),
          const DividerWithText(text: 'OR'),
          const SizedBox(height: 20),
          SocialButton(label: 'Sign in with Google', icon: Icons.g_mobiledata),
          const SizedBox(height: 12),
          SocialButton(label: 'Sign in with Apple', icon: Icons.apple),
          const SizedBox(height: 12),
          SocialButton(label: 'Sign in with Facebook', icon: Icons.facebook),
          const SizedBox(height: 16),
          Center(
            child: Text.rich(TextSpan(
              text: "Don't have an account? ",
              children: [
                TextSpan(
                    text: 'Sign Up',
                    style:
                        TextStyle(color: _brown, fontWeight: FontWeight.w600))
              ],
            )),
          ),
        ],
      );

  // dummy phone fields
  Widget _phoneFields() => _emailFields();

  Widget _inputField(
          {required String hint,
          required IconData icon,
          bool obscure = false}) =>
      TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
}
