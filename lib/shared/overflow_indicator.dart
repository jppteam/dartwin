import 'dart:ui' as ui;

import 'package:flutter/material.dart';

enum _OverflowSide {
  left,
  top,
  bottom,
  right,
}

class CustomOverflowIndicator extends StatelessWidget {
  final Widget? child;

  const CustomOverflowIndicator({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _OverflowIndicatorPainter(),
      child: child,
    );
  }
}

class _OverflowIndicatorPainter extends CustomPainter {
  static const Color _black = Color(0xBF000000);
  static const Color _yellow = Color(0xBFFFFF00);

  static const double _indicatorFontSizePixels = 10;

  static final Paint _indicatorPaint = Paint()
    ..shader = ui.Gradient.linear(
      const Offset(0.0, 0.0),
      const Offset(10.0, 10.0),
      <Color>[_black, _yellow, _yellow, _black],
      <double>[0.25, 0.25, 0.75, 0.75],
      TileMode.repeated,
    );
  static final Paint _labelBackgroundPaint = Paint()
    ..color = const Color(0xFFFFFFFF);

  static const TextStyle _indicatorTextStyle = TextStyle(
    color: Color(0xFF900000),
    fontSize: _indicatorFontSizePixels,
    fontWeight: FontWeight.w800,
  );
  final List<TextPainter> _indicatorLabel = List<TextPainter>.filled(
    _OverflowSide.values.length,
    TextPainter(textDirection: TextDirection.ltr),
  );

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTRB(0.0, 0.0, size.width, size.height),
        _indicatorPaint); // Нижний левый

    _indicatorLabel[2].text = const TextSpan(
      text: 'BOTTOM OVERFLOWED BY 0.00625 PIXELS',
      style: _indicatorTextStyle,
    );
    _indicatorLabel[2].layout();

    final Offset labelOffset = Offset(size.width / 2, size.height - 10.0);
    final Offset centerOffset = Offset(-_indicatorLabel[2].width / 2.0, 0.0);
    final Rect textBackgroundRect = centerOffset & _indicatorLabel[2].size;
    canvas.save();
    canvas.translate(labelOffset.dx, labelOffset.dy);
    canvas.drawRect(textBackgroundRect, _labelBackgroundPaint);
    _indicatorLabel[2].paint(canvas, centerOffset);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_OverflowIndicatorPainter oldDelegate) => false;
}
