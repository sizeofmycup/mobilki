import 'package:flutter/material.dart';

/// Аватары, наложенные друг на друга, и кружок «N+».
class AvatarStack extends StatelessWidget {
  final List<Color> colors;
  final int extra;
  final double size;

  const AvatarStack({
    super.key,
    required this.colors,
    this.extra = 0,
    this.size = 26,
  });

  @override
  Widget build(BuildContext context) {
    final count = colors.length + (extra > 0 ? 1 : 0);
    final step = size * 0.65;
    return SizedBox(
      height: size,
      width: step * (count - 1) + size,
      child: Stack(
        children: [
          for (var i = 0; i < colors.length; i++)
            Positioned(left: i * step, child: _circle(colors[i], null)),
          if (extra > 0)
            Positioned(
              left: colors.length * step,
              child: _circle(const Color(0xFFF7B04A), '$extra+'),
            ),
        ],
      ),
    );
  }

  Widget _circle(Color color, String? text) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      alignment: Alignment.center,
      child: text == null
          ? Icon(Icons.person, size: size * 0.6, color: Colors.white)
          : Text(
              text,
              style: TextStyle(
                fontSize: size * 0.35,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
    );
  }
}
