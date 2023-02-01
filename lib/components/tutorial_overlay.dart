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

