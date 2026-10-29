import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'screens/session_screen.dart';
import 'screens/meditate_screen.dart';
import 'screens/tasks_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Практическая работа: макеты',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4A9C9C),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MenuScreen(),
    );
  }
}

/// Главное меню: кнопки для перехода на каждый из 4 макетов.
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItem>[
      _MenuItem('Простой 1: Welcome (medinow)', const WelcomeScreen()),
      _MenuItem('Простой 2: Mind Deep Relax', const SessionScreen()),
      _MenuItem('Сложный 1: Meditate (каталог)', const MeditateScreen()),
      _MenuItem('Сложный 2: Task Manager', const TasksScreen()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Макеты')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) => ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          leading: CircleAvatar(child: Text('${i + 1}')),
          title: Text(items[i].title),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => items[i].screen),
          ),
        ),
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final Widget screen;
  _MenuItem(this.title, this.screen);
}
