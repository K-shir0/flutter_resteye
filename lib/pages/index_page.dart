import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_resteye/components/number_of_times_used.dart';
import 'package:flutter_resteye/core/pinp_controller.dart';
import 'package:flutter_resteye/core/pinp_view.dart';
import 'package:flutter_resteye/components/_components.dart';
import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/core/selected_assets.dart';
import 'package:flutter_resteye/core/usege_time.dart';
import 'package:flutter_resteye/pages/setting_page.dart';
import 'package:flutter_resteye/pages/tutorial_page/tutorial_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with WidgetsBindingObserver {
  final _controller = PinPController();

  /// PinP がアクティブかどうか
  var _isPictureInPictureActive = false;
  var _showPinP = true;

  /// どの動画が選択されているか
  var _selectedMovie = -1;

  /// 使用時間
  var _usageTime = 0;

  /// 連続使用回数
  var _numberOfConsecutiveUses = 0;

  /// まばたきの回数
  var _numberOfBlinks = 0;

  /// 使用時間の状態を更新するタイマー
  Timer? _usageTimeRenewTimer;

  @override
  void initState() {
    super.initState();
    // アプリのライフサイクルを監視するために必要
    // -> with WidgetsBindingObserver
    WidgetsBinding.instance.addObserver(this);

    // タイマーをセットし定期的に PinP の状態をチェックする
    // 状態が変わっていれば setState する
    Timer.periodic(
      const Duration(microseconds: 200),
      (Timer timer) async {
        final result = await _controller.isPictureInPictureActive();

        if (_isPictureInPictureActive != result) {
          setState(() {
            _isPictureInPictureActive = result;
          });
        }
      },
    );

    // タイマーを初期化
    setUsageRenewTimer();

    // 使用時間と選択している画像の状態を初期化
    _updateUsageState();
    _initSelectedMovieState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // アプリを離れたときにタイマーを止める
    // バックグラウンドで使用時間を取得し続けると重くなるため
    switch (state) {
      // 再開したとき
      case AppLifecycleState.resumed:
        setUsageRenewTimer();
        break;
      // 止めたとき
      case AppLifecycleState.paused:
      case AppLifecycleState.inactive:
        _usageTimeRenewTimer?.cancel();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBarBGColor,
      body: SafeArea(
        child: Container(
          color: AppColors.bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 56.h,
                color: AppColors.appBarBGColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 16),
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color: AppColors.settingBgColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppColors.settingShadowColor.withOpacity(0.2),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => _toPage(context, const SettingPage()),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SvgPicture.asset(
                              'assets/svg_images/setting.svg',
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _toPage(context, const TutorialPage()),
                        child: SvgPicture.asset(
                          'assets/svg_images/question.svg',
                          width: 32.w,
                          height: 32.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 32.h),
                          GestureDetector(
                            onLongPress: () {
                              HapticFeedback.heavyImpact();
                              _controller.toggle();
                            },
                            child: Container(
                              color: AppColors.pinpBgColor,
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 148.h, maxWidth: 304.w),
                                child: _showPinP
                                    ? const PinPView()
                                    : SizedBox(height: 152.h),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          !_isPictureInPictureActive
                              ? RestEyeMainButton(
                                  onPressed: () => _controller.toggle(),
                                  text:
                                      AppLocalizations.of(context)!.startButton,
                                )
                              : RestEyeSubButton(
                                  onPressed: () => _controller.toggle(),
                                  text: AppLocalizations.of(context)!.endButton,
                                ),
                          SizedBox(height: 32.h),
                          Card(
                            color: AppColors.cardBgColor,
                            elevation: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 8.h),
                              child: Column(
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.usageRecordTitle,
                                    style: TextStyle(
                                      color: AppColors.titleTextColor,
                                      fontSize: 16.sp,
                                      letterSpacing: 1.15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Wrap(
                                      alignment: WrapAlignment.spaceBetween,
                                      runSpacing: 8.h,
                                      children:  [
                                        RestEyeUsageRecordCard(
                                          asset:
                                          "assets/svg_images/calendar.svg",
                                          label: AppLocalizations.of(context)!.usageRecordLabel1,
                                          value: _numberOfConsecutiveUses,
                                          unit: AppLocalizations.of(context)!.usageRecordUtil1,
                                        ),
                                        RestEyeUsageRecordCard(
                                          asset:
                                          "assets/svg_images/clock.svg",
                                          label: AppLocalizations.of(context)!.usageRecordLabel2,
                                          value: _usageTime,
                                          unit: AppLocalizations.of(context)!.usageRecordUtil2,
                                        ),
                                        RestEyeUsageRecordCard(
                                          asset: "assets/svg_images/eye.svg",
                                          label: AppLocalizations.of(context)!.usageRecordLabel3,
                                          value: _numberOfBlinks,
                                          unit: AppLocalizations.of(context)!.usageRecordUtil3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                          Column(
                            children: [
                              Text(
                                AppLocalizations.of(context)!.changeVideoButton,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titleTextColor,
                                  letterSpacing: 1.15,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      saveSelectedAssetsNumber(0);
                                      _controller.setAsset(0);
                                      setState(() => _selectedMovie = 0);
                                    },
                                    child: RestEyeCard(
                                      asset: 'assets/images/open@3x.png',
                                      selected: _selectedMovie == 0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      saveSelectedAssetsNumber(1);
                                      _controller.setAsset(1);
                                      setState(() => _selectedMovie = 1);
                                    },
                                    child: RestEyeCard(
                                      asset: 'assets/images/open_boy@3x.png',
                                      selected: _selectedMovie == 1,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      saveSelectedAssetsNumber(2);
                                      _controller.setAsset(2);
                                      setState(() => _selectedMovie = 2);
                                    },
                                    child: RestEyeCard(
                                      asset: 'assets/images/open_girl@3x.png',
                                      selected: _selectedMovie == 2,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 32.h),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   height: 74.0.h,
              //   color: AppColors.adBgColor,
              //   child: Text(AppLocalizations.of(context)!.ad,
              //       style: TextStyle(
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.bold,
              //       ),
              //       textAlign: TextAlign.center),
              // )
            ],
          ),
        ),
      ),
    );
  }

  /// 別ページに遷移する際に PinP が残るので非表示にする
  ///
  ///  その後ポップしてきた場合に非表示になったままになるので
  ///  フラグを変えて表示する
  Future<void> _toPage(BuildContext context, Widget page) async {
    setState(() => _showPinP = false);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );

    setState(() => _showPinP = true);
  }

  /// 使用状況更新用タイマー
  void setUsageRenewTimer() async {
    _usageTimeRenewTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // フロントが完成次第削除
      print('使用時間: $_usageTime秒');
      print('まばたきの回数: ${_usageTime / 3}回');

      _updateUsageState();
    });
  }

  /// 使用状況を更新
  Future<void> _updateUsageState() async {
    final usageTime = await getUsageTime();
    final numberOfConsecutiveUses = await getNumberOfTimesUsed();
    setState(() {
      _usageTime = usageTime ~/ 60;
      _numberOfConsecutiveUses = numberOfConsecutiveUses;
      _numberOfBlinks = usageTime ~/ 3;
    });
  }

  /// 再起動時に選択されていた動画を初期化する
  Future<void> _initSelectedMovieState() async {
    final selectAssetsNumber = await getSelectedAssetsNumber();
    setState(() => _selectedMovie = selectAssetsNumber);
  }
}
