import 'package:flutter/material.dart';
import 'package:my_cool_game/domain/core/globals.dart';

class AdventureStyleText extends StatelessWidget {
  static const letterSpacing = 5.0;

  final String title;
  final double fontSizeMultiplier;

  const AdventureStyleText({
    required this.title,
    this.fontSizeMultiplier = 0.05,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fontSize = size.width * fontSizeMultiplier;

    final baseStyle = TextStyle(
      fontSize: fontSize,
      fontFamily: Globals.fonts.adventure,
      fontWeight: FontWeight.bold,
      letterSpacing: letterSpacing,
    );

    return Transform(
      transform: Matrix4.skewX(-0.2),
      child: Stack(
        children: [
          // Drop shadow layer
          Text(
            title,
            style: baseStyle.copyWith(
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(10, 10),
                  blurRadius: 8,
                ),
              ],
            ),
          ),

          // Border/Stroke effect
          Text(
            title,
            style: baseStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 4
                ..color = Colors.black,
            ),
          ),

          // Inner stroke
          Text(
            title,
            style: baseStyle.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = Colors.white,
            ),
          ),

          // Gradient fill
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.orange,
                Colors.yellow,
              ],
            ).createShader(bounds),
            child: Text(
              title,
              style: baseStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
