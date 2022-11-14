import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_resteye/core/initialize.dart';
import 'package:flutter_resteye/core/pinp_controller.dart';
import 'package:flutter_resteye/core/selected_assets.dart';
import 'package:flutter_resteye/pages/index_page.dart';
import 'package:flutter_resteye/pages/landing_page.dart';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Platform.localeName;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
              fontFamily: locale == "ja_JP" ? 'NotoSansJP' : "Roboto"),
          home: const _Body(),
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 初回起動かどうか判定

    return FutureBuilder(
      future: _initializedStatus(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!) {
            return const IndexPage();
          } else {
            return const LandingPage();
          }
        } else {
          // 実際にはここは表示されない
          // NativeSplash が表示されるため
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<bool> _initializedStatus() async {
    final initializedStatus = getInitializeStatus();

    // ロゴ画像をキャッシュ
    await precachePicture(
      ExactAssetPicture(
        SvgPicture.svgStringDecoderBuilder,
        'assets/svg_images/logo.svg',
      ),
      null,
    );

    // まばたき画像のアセットをセットしておく
    PinPController().setAsset(await getSelectedAssetsNumber());

    // スプラッシュを削除
    FlutterNativeSplash.remove();

    return initializedStatus;
  }
}
