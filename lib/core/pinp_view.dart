import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

/// PinP を表示できる View
class PinPView extends StatelessWidget {
  const PinPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(150.w, 76.h, 0),
      child: const UiKitView(viewType: 'sample'),
    );
  }
}
