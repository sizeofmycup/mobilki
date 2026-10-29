import 'package:flutter/material.dart';

import '../widgets/avatar_stack.dart';

/// Сложный макет 2: менеджер задач с горизонтальным списком,
/// карточками задач и нижней навигацией.
class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  static const blue = Color(0xFF5B6CF9);
  static const bg = Color(0xFFF6F7FB);

  int tab = 0;
  bool firstDone = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: [
            _header(),
            const SizedBox(height: 24),
            _sectionTitle('My Weekly Tasks', '18 Tasks Pending'),
            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  _WeeklyCard(
                    tag: 'UI/UX Design',
                    tagColor: Color(0xFF7B61FF),
                    priority: 'High',
                    priorityColor: Color(0xFFFF5C5C),
                    title: 'Create a Landing Page',
                    date: 'Mon, 12 July 2022',
                    extra: 3,
                  ),
                  SizedBox(width: 12),
                  _WeeklyCard(
                    tag: 'Development',
                    tagColor: Color(0xFFF29A4A),
                    priority: 'Low',
                    priorityColor: Color(0xFF3CC47C),
                    title: 'Develop a Website',
                    date: 'Mon, 30 July 2022',
                    extra: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _sectionTitle("Today's Tasks", '18 Tasks Pending'),
            const SizedBox(height: 12),
            _todayCard(
              title: 'Design 2 App Screens',
              subtitle: 'Crypto Wallet App',
              done: firstDone,
              onToggle: () => setState(() => firstDone = !firstDone),
              date: 'Mon, 10 July 2022',
            ),
            _todayCard(
              title: 'Design Homepage',
              subtitle: 'Water Company Website',
              done: false,
              date: 'Tue, 11 July 2022',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        onTap: (i) => setState(() => tab = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blue,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined), label: 'Projects'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined), label: 'Members'),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF8E9AAF),
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Evening!',
                    style: TextStyle(fontSize: 11, color: Colors.grey)),
                Text('Dan Smith',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          _roundIcon(Icons.search),
          const SizedBox(width: 8),
          _roundIcon(Icons.notifications_none),
        ],
      ),
    );
  }

  Widget _roundIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20),
    );
  }

  Widget _sectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700)),
                Text(subtitle,
                    style: const TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.tune, size: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: 1,
            height: 20,
            color: Colors.grey.shade300,
          ),
          const Icon(Icons.add, size: 22),
        ],
      ),
    );
  }

  Widget _todayCard({
    required String title,
    required String subtitle,
    required bool done,
    required String date,
    VoidCallback? onToggle,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style:
                            const TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onToggle,
                child: Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: done ? blue : Colors.transparent,
                    border: Border.all(color: blue, width: 2),
                  ),
                  child: done
                      ? const Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 14),
              const SizedBox(width: 6),
              Text(date,
                  style: const TextStyle(fontSize: 11, color: Colors.grey)),
              const Spacer(),
              const AvatarStack(
                colors: [Color(0xFF8E9AAF), Color(0xFFB08968)],
                extra: 1,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WeeklyCard extends StatelessWidget {
  final String tag, priority, title, date;
  final Color tagColor, priorityColor;
  final int extra;

  const _WeeklyCard({
    required this.tag,
    required this.tagColor,
    required this.priority,
    required this.priorityColor,
    required this.title,
    required this.date,
    required this.extra,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _chip(tag, tagColor),
              const SizedBox(width: 6),
              _chip(priority, priorityColor),
            ],
          ),
          const SizedBox(height: 10),
          Text(title,
              maxLines: 2,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          const Spacer(),
          AvatarStack(
            colors: const [Color(0xFF8E9AAF), Color(0xFFB08968)],
            extra: extra,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.calendar_today_outlined, size: 13),
              const SizedBox(width: 6),
              Text(date,
                  style: const TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String text, Color color) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 9, color: color)),
      ),
    );
  }
}
