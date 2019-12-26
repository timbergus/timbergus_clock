import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:flutter_clock_helper/model.dart';

// Clock elements.
import 'package:timbergus_clock/tools/draw_center.dart';
import 'package:timbergus_clock/tools/draw_hand.dart';
import 'package:timbergus_clock/tools/draw_second_hand.dart';
import 'package:timbergus_clock/tools/draw_info.dart';
import 'package:timbergus_clock/tools/draw_marks.dart';
import 'package:timbergus_clock/tools/colorProvider.dart';

class TimbergusClock extends StatefulWidget {
  final ClockModel model;
  final ColorProvider colorProvider;

  const TimbergusClock(this.model, this.colorProvider);

  @override
  _TimbergusClockState createState() => _TimbergusClockState();
}

class _TimbergusClockState extends State<TimbergusClock> {
  DateTime _now = DateTime.now();
  String _temperature = '';
  String _temperatureRange = '';
  String _condition = '';
  String _location = '';
  Timer _timer;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateTime();
    _updateModel();
  }

  @override
  void didUpdateWidget(TimbergusClock oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.model != oldWidget.model) {
      oldWidget.model.removeListener(_updateModel);
      widget.model.addListener(_updateModel);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    widget.model.removeListener(_updateModel);
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      _temperature = widget.model.temperatureString;
      _temperatureRange =
          '${widget.model.lowString} - ${widget.model.highString}';
      _condition = widget.model.weatherString;
      _location = widget.model.location;
    });
  }

  void _updateTime() {
    setState(() {
      _now = DateTime.now();
      _timer = Timer(
        Duration(seconds: 1) - Duration(milliseconds: _now.millisecond),
        _updateTime,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context).brightness == Brightness.dark
        ? Theme.of(context).copyWith(
            // Hour hand.
            primaryColor: widget.colorProvider.getGoogleColor('red'),
            // Minute hand.
            primaryColorDark: widget.colorProvider.getGoogleColor('green'),
            // Second hand.
            primaryColorLight: widget.colorProvider.getGoogleColor('blue'),
            // Dots.
            highlightColor: widget.colorProvider.getBackground('light'),
            // Texts.
            splashColor: widget.colorProvider.getGoogleColor('blue'),
            // Background
            backgroundColor: widget.colorProvider.getBackground('dark'),
          )
        : Theme.of(context).copyWith(
            primaryColor: widget.colorProvider.getGoogleColor('red'),
            primaryColorDark: widget.colorProvider.getGoogleColor('green'),
            primaryColorLight: widget.colorProvider.getGoogleColor('blue'),
            highlightColor: widget.colorProvider.getBackground('dark'),
            splashColor: widget.colorProvider.getGoogleColor('blue'),
            backgroundColor: widget.colorProvider.getBackground('light'),
          );

    /**
     * To simplify the clock, we are going to pass the angles for the elements
     * and let the element only in charge of painting themselves.
     *
     * We have two main divisions: 60deg and 12deg (seconds and minutes,
     * and hours respectively).
     */

    final double angle60 = 2.0 * math.pi / 60.0;
    final double angle12 = 2.0 * math.pi / 12.0;

    /**
     * With that in mind, our angles will be the time value times the angle
     * the time should cover each tick.
     *
     * In the case of minutes and hours, we need to add a correction. The
     * proportional part that has cover the previous hand in its displacement.
     */

    final double secondAngle = _now.second * angle60;
    final double minuteAngle = (_now.minute + (_now.second / 60.0)) * angle60;
    final double hourAngle = (_now.hour + (_now.minute / 60.0)) * angle12;

    /**
     * And finally we compose our clock's elements. They are only the essential:
     *
     * * Info: with the place, temp and weather information.
     * * Marks: to draw the crown dots.
     * * Center: the element in the center of the clock.
     * * Hands: the clock's hands with a special type for the second hand.
     */

    return Container(
      color: customTheme.backgroundColor,
      child: Container(
        color: customTheme.backgroundColor,
        child: Stack(
          children: <Widget>[
            DrawInfo(
              condition: _condition,
              location: _location,
              temperature: _temperature,
              temperatureRange: _temperatureRange,
              color: customTheme.splashColor,
            ),
            DrawMarks(
              color: customTheme.highlightColor,
            ),
            DrawHand(
              angle: minuteAngle,
              length: 50,
              color: customTheme.primaryColorDark,
              thick: 3,
            ),
            DrawHand(
              angle: hourAngle,
              length: 100,
              color: customTheme.primaryColor,
              thick: 4,
            ),
            DrawSecondHand(
              angle: secondAngle,
              length: 30,
              colors: widget.colorProvider,
            ),
            DrawCenter(),
          ],
        ),
      ),
    );
  }
}
