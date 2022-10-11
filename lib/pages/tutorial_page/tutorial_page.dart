import 'package:flutter/material.dart';

import 'package:flutter_resteye/pages/tutorial_page/components/check_box_text.dart';
import 'package:flutter_resteye/components/main_button.dart';
import 'package:flutter_resteye/constants.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 30, 32, 36),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
                      child: Column(
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
                  ),
                ),
                const SizedBox(height: 36),
                RestEyeMainButton(
                  onPressed: () {},
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
