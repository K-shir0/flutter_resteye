import 'package:flutter_screenutil/flutter_screenutil.dart';

extension IntEx on int {
  double get sp {
    final screenUtil = ScreenUtil();

    final fontSize = ScreenUtil().setSp(toDouble());

    if (screenUtil.scaleText <= 1.3) {
      return fontSize;
    }

    if (screenUtil.scaleText > 3) {
      return fontSize * 0.4;
    }

    return fontSize * 0.6;
  }
}
