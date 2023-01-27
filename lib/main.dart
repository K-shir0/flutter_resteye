import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_resteye/app.dart';
import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/firebase_options.dart';
import 'package:flutter_resteye/components/number_of_times_used.dart';
import 'package:flutter_resteye/core/_core.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // AdMob 初期化
  MobileAds.instance.initialize();

  // Purchases 初期化
  await Purchases.setDebugLogsEnabled(true);
  final configuration = PurchasesConfiguration(kRCSDKAPIKeyIos);
  await Purchases.configure(configuration);

  // Firebase 初期化
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 画面の向き上部固定
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //ステータスバーの色固定
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarBrightness: Brightness.light));

  // admob の引数が無いとエラー
  if (kAdUnitIdIndexBottom == "") {
    throw ArgumentError(
      'ad unit id is not defined'
      'Set unit id using `--dart-define`.',
    );
  }

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

    saveUsageTime(0);
  }
  // 最終使用時間を更新
  saveLastUsedTime();

  runApp(const App());
}
