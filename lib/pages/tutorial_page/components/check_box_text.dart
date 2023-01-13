import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/utils/font_util.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxText extends StatelessWidget {
  const CheckBoxText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 黄色い丸
        Container(
          width: 32.w,
          height: 32.h,
          decoration: const BoxDecoration(
            color: AppColors.addButtonBgColor,
            shape: BoxShape.circle,
          ),
          // svg をセンターに
          child: SvgPicture.asset('assets/svg_images/check.svg',
              color: AppColors.addButtonTextColor,
              width: 30.w,
              height: 18.h,
              fit: BoxFit.scaleDown),
        ),
        SizedBox(width: 16.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            letterSpacing: 1.1,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }
}
