import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/waveforms/waveform_painters_ab.dart';

class RectangleActiveWaveformPainter extends ActiveWaveformPainter {
  RectangleActiveWaveformPainter({
    required Color color,
    Gradient? gradient,
    required List<double> samples,
    required int activeIndex,
    required List<double> activeSamples,
  }) : super(
            samples: samples,
            color: color,
            gradient: gradient,
            activeIndex: activeIndex,
            activeSamples: activeSamples);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(0, size.height / 2);

    final activeTrackPaint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..shader = gradient?.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );

    final double rectangelWidth = size.width / samples.length;

    for (var i = 0; i < activeSamples.length; i++) {
      final double x = rectangelWidth * i;
      //make y abs to have one sided waveform
      final double y = activeSamples[i];

      canvas.drawRect(
        Rect.fromLTWH(x, 0, rectangelWidth, y),
        activeTrackPaint,
      );
    }
  }
}
