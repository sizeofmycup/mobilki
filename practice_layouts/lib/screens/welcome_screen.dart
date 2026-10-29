import 'package:flutter/material.dart';

import '../widgets/app_image.dart';

/// Простой макет 1: стартовый экран medinow.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const teal = Color(0xFF4A9C9C);
  static const lightTeal = Color(0xFFD5F0EF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teal,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'medinow',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Meditate With Us!',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  _button('Sign in with Apple', Colors.white),
                  const SizedBox(height: 12),
                  _button('Continue with Email or Phone', lightTeal),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue With Google',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16),
                child: AppImage(
                  asset: 'assets/images/meditation.png',
                  color: Color(0xFF3C8585),
                  icon: Icons.self_improvement,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _button(String text, Color background) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: background,
          foregroundColor: Colors.black87,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Text(text, style: const TextStyle(fontSize: 14)),
      ),
    );
  }
}
