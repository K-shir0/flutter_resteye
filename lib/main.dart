import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_resteye/app.dart';
import 'package:flutter_resteye/components/number_of_times_used.dart';
import 'package:flutter_resteye/core/_core.dart';

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
  // 2日以上であれば使用回数をリセット
  final lastUsedTime = await getLastUsedTime();
  // 何日ぶりに起動するかの日数
  final diffUsedDays = DateTime.now().difference(lastUsedTime).inDays;

  if (lastUsedTime != DateTime.fromMillisecondsSinceEpoch(0) &&
      diffUsedDays >= 1) {
    // 2日以上か判定
    if (diffUsedDays >= 2) {
      // 2日以上の場合は使用回数を0にする
      resetNumberOfTimesUsed();
    } else {
      // 1日以上の場合は使用回数を1増加
      incrementNumberOfTimesUsed();
    }

    print(diffUsedDays);

    saveUsageTime(0);
  }
  // 最終使用時間を更新
  saveLastUsedTime();

  runApp(const App());
}
