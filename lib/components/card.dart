import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestEyeCard extends StatelessWidget {
  const RestEyeCard({
    Key? key,
    required this.asset,
    required this.selected,
  }) : super(key: key);

  final String asset;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.w,
      height: 72.h,
      child: Card(
        shape: selected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: BorderSide(
                  color: AppColors.movieSelectedColor,
                  width: 2.w,
                ),
              )
            : null,
        color: AppColors.pinpBgColor,
        child: Image.asset(asset),
      ),
    );
  }
}
