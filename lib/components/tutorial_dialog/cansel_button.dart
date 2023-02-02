import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// tutorial_dialog 内のみで使用する
/// 他で利用する場合は改良が必要
class CanselButton extends StatelessWidget {
  const CanselButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      color: Colors.white,
      // size
      iconSize: 32.w,
      onPressed: () {
        Navigator.of(context).pop(false);
      },
    );
  }

}