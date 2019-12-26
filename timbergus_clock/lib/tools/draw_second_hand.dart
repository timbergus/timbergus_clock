import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:timbergus_clock/tools/colorProvider.dart';

class DrawSecondHand extends StatelessWidget {
  final double angle;
  final double length;
  final double thick;
  final ColorProvider colors;

  DrawSecondHand({
    this.angle,
    this.length,
    this.thick,
    this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: MyPainter(
            angle: this.angle,
            length: this.length,
            colors: this.colors,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double angle;
  final double length;
  final ColorProvider colors;

  MyPainter({
    this.angle,
    this.length,
    this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final length = (size.shortestSide - this.length) * 0.5;

    final paint = Paint();

    final zone = 2 * math.pi / 60.0;

    Color color = this.colors.getExtendedRainbowColor();

    List<int> alpha = [255, 200, 150, 100, 90, 70, 50, 30, 10];
    List<double> radius = [5, 4.5, 4, 3.5, 3, 2.5, 2, 1.5, 1];

    for (int i = 0; i < 9; i++) {
      canvas.drawCircle(
        center +
            Offset(
                  math.sin(this.angle - i * zone),
                  -math.cos(this.angle - i * zone),
                ) *
                length,
        radius[i],
        paint..color = color.withAlpha(alpha[i]),
      );
    }
  }

  @override
  bool shouldRepaint(MyPainter old) {
    return this.angle != old.angle;
  }
}
