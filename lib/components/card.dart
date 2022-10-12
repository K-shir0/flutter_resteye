import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestEyeCard extends StatelessWidget {
  const RestEyeCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88.w,
      height: 72.h,
      child: Card(
        color: AppColors.cardBgColor,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              letterSpacing: 1.10,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
