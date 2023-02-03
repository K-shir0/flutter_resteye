import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/utils/_utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubOutlineButton extends StatelessWidget {
  const SubOutlineButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: AppColors.subOutlineButtonFrameColor,
          width: 2.w,
        ),
        fixedSize: Size(124.w, 56.h),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.15,
          height: 1.3,
          color: AppColors.subOutlineButtonFrameTextColor,
        ),
      ),
    );
  }
}
