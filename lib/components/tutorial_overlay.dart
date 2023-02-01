import 'package:flutter/material.dart';

class TutorialOverlay {
  TutorialOverlay._();

  static Future<T?> show<T>(
    BuildContext context,
    Widget hole,
    Widget overlay,
  ) async {
    return await showDialog<T>(
      useSafeArea: false,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => _dialog(context, hole, overlay),
    );
  }

  static Widget _dialog(
    BuildContext context,
    Widget hole,
    Widget overlay,
  ) {
    return Stack(
      children: [
        SizedBox.expand(
          child: ColorFiltered(
            colorFilter: const ColorFilter.mode(
              Colors.black54,
              BlendMode.srcOut,
            ),
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: hole,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox.expand(
          child: Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: overlay,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    // 三角（塗りつぶし）
    paint.color = Colors.white;
    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
