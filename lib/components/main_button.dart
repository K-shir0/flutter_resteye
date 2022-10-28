import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestEyeMainButton extends StatelessWidget {
  const RestEyeMainButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.buttonColor,
    this.textColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300.w, 56.h),
        backgroundColor: buttonColor ?? AppColors.mainButtonBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.15,
          height: 1.2,
          color: textColor ?? AppColors.mainButtonTextColor,
        ),
      ),
    );
  }
}
