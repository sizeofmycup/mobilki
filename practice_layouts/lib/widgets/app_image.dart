import 'package:flutter/material.dart';

/// Картинка из assets. Если файла нет, показывает цветную заглушку с иконкой.
class AppImage extends StatelessWidget {
  final String asset;
  final Color color;
  final IconData icon;
  final double? height;
  final double radius;
  final BoxFit fit;

  const AppImage({
    super.key,
    required this.asset,
    required this.color,
    this.icon = Icons.image_outlined,
    this.height,
    this.radius = 0,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Image.asset(
          asset,
          fit: fit,
          errorBuilder: (_, __, ___) => Container(
            color: color,
            alignment: Alignment.center,
            child: Icon(icon, size: 48, color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
