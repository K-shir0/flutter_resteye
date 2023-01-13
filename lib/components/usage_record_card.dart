import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/utils/font_util.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RestEyeUsageRecordCard extends StatelessWidget {
  const RestEyeUsageRecordCard({
    Key? key,
    required this.asset,
    required this.label,
    required this.value,
    required this.unit,
  }) : super(key: key);

  final String asset;
  final String label;
  final int value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              asset,
              width: 16.w,
              height: 16.h,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 4.w),
            Opacity(
              opacity: 0.6,
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  letterSpacing: 1.15,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 20.w),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 24.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.w700,
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              unit,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                height: 1.3.h,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
