import 'package:flutter/material.dart';

class TextBubble extends StatelessWidget {
  final String text;
  final Color color;
  final Alignment alignment;

  TextBubble({
    this.text,
    this.color,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      alignment: alignment,
      margin: EdgeInsets.all(5),
      child: Text(
        this.text,
        style: TextStyle(
          color: this.color,
        ),
      ),
    );
  }
}
