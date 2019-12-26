import 'package:flutter/material.dart';

class ColorProvider {
  int index = 0;

  // Google colors.
  final Color red = Color(0xFFEA4335);
  final Color green = Color(0xFF34AB53);
  final Color blue = Color(0xFF4285F4);
  final Color yellow = Color(0xFFFBBC05);

  // Background colors.
  final Color black = Color(0xFF3B3B46);
  final Color white = Color(0xFFFBFAFA);

  // Rainbow colors.
  List<Color> rainbowColors = [
    Color(0xFFEA4335), // Red.
    Color(0xFFFA9200), // Orange.
    Color(0xFFFBBC05), // Yellow.
    Color(0xFF34AB53), // Green.
    Color(0xFF4285F4), // Blue.
    Color(0xFF8565C4), // Violet.
  ];

  // Rainbow colors.
  List<Color> extendedRainbowColors = [
    Color(0XFFE6261F), // Red.
    Color(0XFFEB7532), // Orange.
    Color(0XFFF7D038), // Yellow.
    Color(0XFFA3E048), // Green.
    Color(0XFF49DA9A), // Dark green.
    Color(0XFF34BBE6), // Blue.
    Color(0XFF4355DB), // Dark blue.
    Color(0XFFD23BE7), // Violet.
  ];

  Color getGoogleColor(color) {
    switch (color) {
      case 'red':
        return red;
      case 'green':
        return green;
      case 'blue':
        return blue;
      case 'yellow':
        return yellow;
      default:
        return red;
    }
  }

  Color getBackground(mode) {
    switch (mode) {
      case 'light':
        return white;
      case 'dark':
        return black;
      default:
        return black;
    }
  }

  Color getRainbowColor() {
    Color color = rainbowColors[index];
    index++;
    if (index >= rainbowColors.length) {
      index = 0;
    }
    return color;
  }

  Color getExtendedRainbowColor() {
    Color color = extendedRainbowColors[index];
    index++;
    if (index >= extendedRainbowColors.length) {
      index = 0;
    }
    return color;
  }
}
