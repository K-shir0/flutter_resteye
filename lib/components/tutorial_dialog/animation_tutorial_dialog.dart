import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_resteye/components/_components.dart';

class AnimationTutorialDialog {
  AnimationTutorialDialog._();

  static Future<bool?> show<T>(
    BuildContext context,
    GlobalKey key,
  ) async {
    final size = MediaQuery.of(context).size;

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
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Positioned(
            top: 64.h,
            left: 32.w,
            child: const CanselButton(),
          ),
          Positioned.fill(
            top: offset.dy,
            child: Column(
              children: [
                Column(
                  children: [
                    Transform.translate(
                      offset: Offset(0, 16.h),
                      child: const Arrow(),
                    ),
                    Card(
                      child: SizedBox(
                        width: size.width - 68.w,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(32.w, 16.h, 32.w, 24.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .indexTutorialDialogMessage1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: 16.h),
                              SubOutlineButton(
                                text: AppLocalizations.of(context)!
                                    .indexTutorialDialogNext,
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                              ),
                            ],
                          ),
                        ),
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
