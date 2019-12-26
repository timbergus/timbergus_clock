import 'dart:math' as math;
import 'package:flutter/material.dart';

class DrawHand extends StatelessWidget {
  final double angle;
  final double length;
  final double thick;
  final Color color;

  DrawHand({
    this.angle,
    this.length,
    this.thick,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.expand(
        child: CustomPaint(
          painter: MyPainter(
            angle: this.angle,
            length: this.length,
            thick: this.thick,
            color: this.color,
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double angle;
  final double length;
  final double thick;
  final Color color;

  MyPainter({
    this.angle,
    this.length,
    this.thick,
    this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final length = (size.shortestSide - this.length) * 0.5;

    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = this.thick
      ..color = this.color;

    canvas.drawLine(
      center +
          Offset(
                math.sin(this.angle),
                -math.cos(this.angle),
              ) *
              15,
      center +
          Offset(
                math.sin(this.angle),
                -math.cos(this.angle),
              ) *
              (length - 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(MyPainter old) {
    return this.angle != old.angle;
  }
}
