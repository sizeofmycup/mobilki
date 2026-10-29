import 'package:flutter/material.dart';

import '../widgets/app_image.dart';

/// Сложный макет 1: каталог медитаций (фильтры, большая карточка, сетка).
class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  static const teal = Color(0xFF4A9C9C);
  static const lightTeal = Color(0xFFE3F3F2);

  final filters = ['All', 'Bible In a Year', 'Dailies', 'Minutes', 'November'];
  int selected = 0;

  final courses = const [
    _Course('The Sleep Hour', 'Ashna Mukherjee', '3 Sessions',
        'sleep_hour.png', Color(0xFFF29A4A)),
    _Course('Easy on the Mission', 'Peter Mach', '5 minutes',
        'easy_mission.png', Color(0xFFEBC35A)),
    _Course('Relax with Me', 'Amanda James', '3 Sessions',
        'relax_with_me.png', Color(0xFF4A7DF0)),
    _Course('Sun and Energy', 'Micheal Hu', '5 minutes', 'sun_energy.png',
        Color(0xFF4A9C9C)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meditate',
            style: TextStyle(fontWeight: FontWeight.w700)),
        actions: [IconButton(icon: const Icon(Icons.search), onPressed: () {})],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // Горизонтальные фильтры-чипы
          SizedBox(
            height: 36,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final active = i == selected;
                return ChoiceChip(
                  label: Text(filters[i]),
                  selected: active,
                  showCheckmark: false,
                  onSelected: (_) => setState(() => selected = i),
                  selectedColor: teal,
                  backgroundColor: lightTeal,
                  side: BorderSide.none,
                  shape: const StadiumBorder(),
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: active ? Colors.white : teal,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Большая карточка
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppImage(
                  asset: 'assets/images/song_of_moon.png',
                  color: Color(0xFFEBC35A),
                  icon: Icons.nightlight_round,
                  height: 170,
                  radius: 10,
                ),
                const SizedBox(height: 10),
                const Text('A Song of Moon',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 2),
                const Text('Start with the basics',
                    style: TextStyle(fontSize: 13)),
                const SizedBox(height: 6),
                _meta('9 Sessions'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Сетка 2×2
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: courses.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (_, i) => _CourseCard(course: courses[i], meta: _meta),
          ),
        ],
      ),
    );
  }

  Widget _meta(String text) {
    return Row(
      children: [
        const Icon(Icons.favorite_border, size: 12, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const Spacer(),
        const Text('Start', style: TextStyle(fontSize: 11, color: Colors.grey)),
        const Icon(Icons.chevron_right, size: 14, color: Colors.grey),
      ],
    );
  }
}

class _Course {
  final String title, author, info, image;
  final Color color;
  const _Course(this.title, this.author, this.info, this.image, this.color);
}

class _CourseCard extends StatelessWidget {
  final _Course course;
  final Widget Function(String) meta;
  const _CourseCard({required this.course, required this.meta});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AppImage(
            asset: 'assets/images/${course.image}',
            color: course.color,
            icon: Icons.wb_twilight,
            radius: 8,
          ),
        ),
        const SizedBox(height: 8),
        Text(course.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        Text(course.author,
            style: const TextStyle(fontSize: 11, color: Colors.grey)),
        const SizedBox(height: 4),
        meta(course.info),
      ],
    );
  }
}
