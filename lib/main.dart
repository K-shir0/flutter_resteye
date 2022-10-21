import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 画面の向き上部固定
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //ステータスバーの色固定
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
      .copyWith(statusBarBrightness: Brightness.light));
  runApp(const App());
}
