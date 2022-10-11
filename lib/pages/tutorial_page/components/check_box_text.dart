import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_resteye/constants.dart';

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
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppColors.addButtonBgColor,
            shape: BoxShape.circle,
          ),
          // svg をセンターに
          child: SvgPicture.asset('assets/svg_images/check.svg',
              color: AppColors.addButtonTextColor,
              width: 22,
              height: 18,
              fit: BoxFit.scaleDown),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            letterSpacing: 1.1,
            color: AppColors.textColor,
          ),
        ),
      ],
    );
  }
}
