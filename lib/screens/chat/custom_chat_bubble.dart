import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomChatBubble extends CustomPainter {
  CustomChatBubble({
    this.color,
    required this.isOwn,
  });

  final Color? color;
  final bool isOwn;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color ?? Colors.blue;

    Path paintBubbleTail() {
      late Path path;
      if (!isOwn) {
        path = Path()
          ..moveTo(5, size.height - 5)
          ..quadraticBezierTo(-5, size.height, -8, size.height - 4)
          ..quadraticBezierTo(-5, size.height - 5, 0, size.height - 15);
      }
      if (isOwn) {
        path = Path()
          ..moveTo(size.width - 5, size.height - 5)
          ..quadraticBezierTo(size.width + 5, size.height, size.width + 8, size.height - 4)
          ..quadraticBezierTo(size.width + 5, size.height - 5, size.width, size.height - 15);
      }
      return path;
    }

    final RRect bubbleBody = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(14),
    );
    final Path bubbleTail = paintBubbleTail();

    canvas.drawRRect(bubbleBody, paint);
    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
