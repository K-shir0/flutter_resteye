import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestEyeCard extends StatelessWidget {
  const RestEyeCard({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final String asset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96.w,
      height: 72.h,
      child: Card(
        color: AppColors.pinpBgColor,
        child: Image.asset(asset),
      ),
    );
  }
}
