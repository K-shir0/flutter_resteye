import 'package:flutter/material.dart';

import '../constants.dart';

class RestEyeCard extends StatelessWidget {
  const RestEyeCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 72,
      child: Card(
        color: Colors.white, // Card自体の色
        child: Center(
          child: Text(
            text,
            style: const TextStyle(letterSpacing: 1.10,fontWeight: FontWeight.w500,color: AppColors.textColor),
          ),
        ),
      ),
    );
  }
}
