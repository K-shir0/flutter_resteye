import 'package:flutter/material.dart';

import 'package:flutter_resteye/core/initialize.dart';
import 'package:flutter_resteye/pages/index_page.dart';
import 'package:flutter_resteye/pages/tutorial_page/components/check_box_text.dart';
import 'package:flutter_resteye/components/main_button.dart';
import 'package:flutter_resteye/constants.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 30.h, 0, 36.h),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: CarouselSlider(
                          carouselController: _controller,
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                            height: double.infinity,
                            initialPage: 0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                          ),
                          items: [
                            // View1
                            _ViewBody(
                              controller: _controller,
                              current: _current,
                              index: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.subTitle,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.1,
                                      color: AppColors.importantTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 32.h),
                                  CheckBoxText(
                                      text: AppLocalizations.of(context)!
                                          .eyeHeavyText),
                                  SizedBox(height: 24.h),
                                  CheckBoxText(
                                      text: AppLocalizations.of(context)!
                                          .eyeTiredText),
                                  SizedBox(height: 24.h),
                                  CheckBoxText(
                                      text: AppLocalizations.of(context)!
                                          .eyeDryText),
                                ],
                              ),
                            ),
                            // View2
                            _ViewBody(
                              controller: _controller,
                              current: _current,
                              index: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.whatAppTitle,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.1,
                                      color: AppColors.importantTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .whatAppDescription,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      letterSpacing: 1.1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // View3
                            _ViewBody(
                              controller: _controller,
                              current: _current,
                              index: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.usageAppTitle,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 1.1,
                                      color: AppColors.importantTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .usageAppDescription,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      letterSpacing: 1.1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 36.h),
                // 最後の画面の時だけボタンの色を変えて目立たせる
                _current != 2
                    ? RestEyeMainButton(
                        onPressed: _onNext,
                        text: AppLocalizations.of(context)!.nextButton,
                      )
                    : RestEyeMainButton(
                        onPressed: _onNext,
                        text: AppLocalizations.of(context)!.startAppButton,
                        buttonColor: AppColors.addButtonBgColor,
                        textColor: AppColors.addButtonTextColor,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// 次のページに進む処理
  /// ページの最後になったら [Navigator] で [IndexPage] に遷移する
  void _onNext() {
    if (_current == 2) {
      saveInitializeStatus(true);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const IndexPage(),
        ),
        (route) => false,
      );
    } else {
      _controller.nextPage();
    }
  }
}

class _ViewBody extends StatelessWidget {
  const _ViewBody({
    required this.controller,
    required this.current,
    required this.index,
    required this.child,
  });

  final CarouselController controller;
  final int current;
  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.w, 40.h, 30.w, 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              child,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 3 回表示
                  for (int i = 0; i < 3; i++) ...[
                    GestureDetector(
                      onTap: () => controller.animateToPage(i),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: current == i
                                ? AppColors.carouselSelectedDotColor
                                : AppColors.carouselUnselectedDotColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
