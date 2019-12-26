import 'dart:math' as math;
import 'package:flutter/material.dart';

class DrawMarks extends StatelessWidget {
  final Color color;

  DrawMarks({
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: MyPainter(
            color: this.color,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Color color;

  MyPainter({
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final length = (size.shortestSide - 30) * 0.5;
    final double angle = math.pi / 6.0;

    final paint = Paint()..color = this.color;

    for (int i = 0; i < 12; i++) {
      canvas.drawCircle(
        center + Offset(math.sin(i * angle), -math.cos(i * angle)) * length,
        i % 3 == 0 ? 5 : 2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
