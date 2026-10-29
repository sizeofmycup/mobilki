import 'package:flutter/material.dart';

import '../widgets/app_image.dart';

/// Простой макет 2: экран сессии Mind Deep Relax.
class SessionScreen extends StatelessWidget {
  const SessionScreen({super.key});

  static const teal = Color(0xFF4A9C9C);

  @override
  Widget build(BuildContext context) {
    final sessions = [
      ('Sweet Memories', const Color(0xFF4A7DF0)),
      ('A Day Dream', teal),
      ('Mind Explore', const Color(0xFFF29A4A)),
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Stack(
              children: [
                const AppImage(
                  asset: 'assets/images/pier.png',
                  color: Color(0xFFEBC35A),
                  icon: Icons.landscape,
                  height: 220,
                  radius: 12,
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Peter Mach',
                style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            const Text(
              'Mind Deep Relax',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            const Text(
              'Join the Community as we prepare over 33 days to relax and '
              'feel joy with the mind and happiness session across the World.',
              style: TextStyle(fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow),
                label: const Text('Play Next Session'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: teal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            for (final (title, color) in sessions) ...[
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.play_arrow, color: Colors.white),
                ),
                title: Text(title,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('December 29 Pre-Launch',
                    style: TextStyle(fontSize: 12)),
                trailing: const Icon(Icons.more_horiz, color: Colors.grey),
              ),
              const Divider(height: 1),
            ],
          ],
        ),
      ),
    );
  }
}
