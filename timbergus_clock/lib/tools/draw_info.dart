import 'package:flutter/material.dart';
import 'package:timbergus_clock/tools/text_bubble.dart';

class DrawInfo extends StatelessWidget {
  final String condition;
  final String location;
  final String temperature;
  final String temperatureRange;
  final Color color;

  DrawInfo({
    this.condition,
    this.location,
    this.temperature,
    this.temperatureRange,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: TextBubble(
            text: this.location,
            color: this.color,
            alignment: Alignment.centerLeft,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: TextBubble(
            text: this.condition[0].toUpperCase() + this.condition.substring(1),
            color: this.color,
            alignment: Alignment.centerRight,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: TextBubble(
            text: this.temperature,
            color: this.color,
            alignment: Alignment.centerLeft,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: TextBubble(
            text: this.temperatureRange,
            color: this.color,
            alignment: Alignment.centerRight,
          ),
        ),
      ],
    );
  }
}
