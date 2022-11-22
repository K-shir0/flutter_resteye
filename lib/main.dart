import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_resteye/app.dart';
import 'package:flutter_resteye/components/number_of_times_used.dart';
import 'package:flutter_resteye/core/last_used_time.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 画面の向き上部固定
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //ステータスバーの色固定
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarBrightness: Brightness.light));

  // 最終使用時間を取得
  // 初期値(0) でないかつ差が1日以上ある場合は使用回数を増加
  final lastUsedTime = await getLastUsedTime();
  if (lastUsedTime != DateTime.fromMillisecondsSinceEpoch(0) &&
      DateTime.now().difference(lastUsedTime).inDays >= 1) {
    incrementNumberOfTimesUsed();
  }
  // 最終使用時間を更新
  saveLastUsedTime();

  runApp(const App());
}
