import 'package:flutter/material.dart';

const kRCSDKAPIKeyIos = String.fromEnvironment('RC_SDK_API_KEY_IOS');
const kAdUnitIdIndexBottom = String.fromEnvironment('AD_UNIT_ID_INDEX_BOTTOM');
const kAdUnitIdSettingTop = String.fromEnvironment('AD_UNIT_ID_SETTING_TOP');

class AppColors {
  static const Color bgColor = Color(0xFFD1E9FF);

  static const Color appBarBGColor = Color(0xFFF5FAFF);
  static const Color cardBgColor = Color(0xFFF5FAFF);
  static const Color pinpBgColor = Color(0xFFFFFFFF);

  /// ローディングのぐるぐるの色
  static const Color indicatorColor = Color(0xFF417FB8);

  /// 設定アイコン
  static const Color settingBgColor = Color(0xFFFFFFFF);
  static const Color settingShadowColor = Color(0xFF13202D);
  static const Color settingAppBarColor = Color(0xFF417FB8);

  static const Color questionBgColor = Color(0xFF417FB8);

  static const Color importantTextColor = Color(0xFF5595D1);
  static const Color titleTextColor = Color(0xFF417FB8);
  static const Color textColor = Color(0xFF13202D);

  static const Color mainButtonBgColor = Color(0xFF417FB8);
  static const Color mainButtonTextColor = Color(0xFFF5FAFF);

  static const Color subButtonBgColor = Color(0xFFF5FAFF);
  static const Color subButtonTextColor = Color(0xFF417FB8);

  static const Color subOutlineButtonFrameColor = Color(0xFFFFBD3E);
  static const Color subOutlineButtonFrameTextColor = Color(0xFFFFBD3E);

  static const Color addButtonBgColor = Color(0xFFFFBD3E);
  static const Color addButtonTextColor = Color(0xFFF5FAFF);

  /// カルーセルの選択済みの色
  static const Color carouselSelectedDotColor = Color(0xFF5595D1);

  /// カルーセルの未選択の色
  static const Color carouselUnselectedDotColor = Color(0xFFBBDEFF);

  static const Color movieSelectedColor = Color(0xFF417FB8);
}
