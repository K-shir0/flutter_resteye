import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestEyeSubButton extends StatelessWidget {
  const RestEyeSubButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(264.w, 56.h),
        primary: AppColors.subButtonBgColor,
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
          color: AppColors.subButtonTextColor,
        ),
      ),
    );
  }
}
