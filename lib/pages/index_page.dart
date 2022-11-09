import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_resteye/core/pinp_controller.dart';
import 'package:flutter_resteye/core/pinp_view.dart';
import 'package:flutter_resteye/components/_components.dart';
import 'package:flutter_resteye/constants.dart';
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

class _IndexPageState extends State<IndexPage> {
  final _controller = PinPController();

  /// PinP がアクティブかどうか
  var _isPictureInPictureActive = false;
  var _showPinP = true;

  @override
  void initState() {
    super.initState();

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
                              color: AppColors.settingShadowColor.withOpacity(0.2),
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => _toPage(context, const SettingPage()),
                          child: SvgPicture.asset(
                            'assets/svg_images/setting.svg',
                            width: 24.w,
                            height: 24.h,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _toPage(context, const TutorialPage()),
                        child:
                            SvgPicture.asset('assets/svg_images/question.svg'),
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
                                    maxHeight: 152.h, maxWidth: 304.w),
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
                          SizedBox(height: 64.h),
                          // Column(
                          //   children: [
                          //     TextButton(
                          //       onPressed: () => {},
                          //       child: Text(
                          //           AppLocalizations.of(context)!
                          //               .changeVideoButton,
                          //           style: TextStyle(
                          //             fontWeight: FontWeight.w600,
                          //             color: AppColors.titleTextColor,
                          //             letterSpacing: 1.15,
                          //             fontSize: 16.sp,
                          //           )),
                          //     ),
                          //     Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         RestEyeCard(
                          //             text:
                          //                 AppLocalizations.of(context)!.video),
                          //         RestEyeCard(
                          //             text:
                          //                 AppLocalizations.of(context)!.video),
                          //         RestEyeCard(
                          //             text:
                          //                 AppLocalizations.of(context)!.video),
                          //       ],
                          //     ),
                          //     SizedBox(height: 16.h),
                          //     ElevatedButton(
                          //       onPressed: () {},
                          //       style: ElevatedButton.styleFrom(
                          //         fixedSize: Size(120.w, 32.h),
                          //         backgroundColor: AppColors.addButtonBgColor,
                          //         shape: const RoundedRectangleBorder(
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(32)),
                          //         ),
                          //       ),
                          //       child: Text(
                          //         AppLocalizations.of(context)!.addButton,
                          //         style: TextStyle(
                          //           fontSize: 16.sp,
                          //           fontWeight: FontWeight.bold,
                          //           letterSpacing: 1.15,
                          //           color: AppColors.addButtonTextColor,
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(height: 32.h),
                          //   ],
                          // ),
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
}
