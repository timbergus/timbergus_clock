import 'package:flutter/material.dart';
import 'package:flutter_clock_helper/model.dart';
import 'package:flutter_clock_helper/customizer.dart';
import 'package:timbergus_clock/timbergus_clock.dart';
import 'package:timbergus_clock/tools/colorProvider.dart';

void main() {
  /**
   * Here we have our color provider. We are going to use
   * it to generate a color sequence for the second hand.
   * It needs to be immutable with the clock refresh because
   * we need an incremental index to have a sequence of known
   * colors.
   */

  ColorProvider colorProvider = new ColorProvider();

  runApp(
    ClockCustomizer(
      (ClockModel model) => TimbergusClock(
        model,
        colorProvider,
      ),
    ),
  );
}
