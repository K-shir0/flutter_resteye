import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter_resteye/pages/tutorial_page/components/check_box_text.dart';
import 'package:flutter_resteye/components/main_button.dart';
import 'package:flutter_resteye/constants.dart';

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
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 36),
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
                                children: const [
                                  Text(
                                    'これらに当てはまるなら、ドライアイの兆候かも…',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                      color: AppColors.importantTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  CheckBoxText(text: '目が重たい感じがする'),
                                  SizedBox(height: 24),
                                  CheckBoxText(text: '目がつかれやすい'),
                                  SizedBox(height: 24),
                                  CheckBoxText(text: '目が乾いている気がする'),
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
                                children: const [
                                  Text(
                                    '[サービスの名前]とは？',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                      color: AppColors.importantTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '目の運動を促すバナーをつねに表示し、ドライアイを予防できるアプリです。',
                                    style: TextStyle(
                                      fontSize: 16,
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
                                children: const [
                                  Text(
                                    '他のアプリも使用可能！',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.1,
                                      color: AppColors.importantTextColor,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '[サービスの名前]以外のアプリケーションを使っていてもOK！さっそく使ってみよう！',
                                    style: TextStyle(
                                      fontSize: 16,
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
                const SizedBox(height: 36),
                RestEyeMainButton(
                  onPressed: () => _controller.nextPage(),
                  text: 'つぎへ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 24),
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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 12,
                          height: 12,
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
