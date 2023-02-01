import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:flutter_resteye/components/_components.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AnimationChangeTutorialDialog {
  AnimationChangeTutorialDialog._();

  static Future<bool?> show<T>(
    BuildContext context,
    GlobalKey key,
  ) async {
    final target = key.currentContext?.findRenderObject() as RenderBox;
    final offset = target.localToGlobal(Offset.zero);

    return await TutorialOverlay.show<bool>(
      context,
      Stack(
        children: [
          Positioned(
            top: offset.dy,
            left: offset.dx,
            child: Container(
              height: target.size.height,
              width: target.size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Positioned.fill(
            top: offset.dy - 240.h,
            child: Column(
              children: [
                Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(32.w, 16.h, 32.w, 24.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .indexTutorialDialogMessage3,
                              style: TextStyle(fontSize: 16.sp),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(height: 16.h),
                            SubOutlineButton(
                              text: 'OK',
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: math.pi / 1,
                      child: Transform.translate(
                        offset: Offset(80.w, 16.h),
                        child: const Arrow(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
