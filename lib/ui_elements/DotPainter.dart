import 'package:flutter/material.dart';
class DotIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _DotPainter();
  }
}

class _DotPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = Color(0xFF464646) // Dot color
      ..isAntiAlias = true;

    final double circleRadius = 4.0; // Size of the dot

    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - circleRadius / 2, // Center the dot
      configuration.size!.height - circleRadius, // Position dot under the label
    );

    canvas.drawCircle(offset + circleOffset, circleRadius, paint);
  }
}
