import 'package:flutter/material.dart';

import 'package:flutter_resteye/constants.dart';

class RestEyeMainButton extends StatelessWidget {
  const RestEyeMainButton({
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
        fixedSize: const Size(300, 50),
        primary: AppColors.mainButtonBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.15,
          color: AppColors.mainButtonTextColor,
        ),
      ),
    );
  }
}
