import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_resteye/core/pinp_controller.dart';
import 'package:flutter_resteye/core/pinp_view.dart';
import 'package:flutter_resteye/components/_components.dart';

import '../constants.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PinPController();

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(title: const Text('RestEyes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(height: 32),
                Container(
                  color: Colors.white,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 152,maxWidth: 304),
                    child: const PinPView(),
                  ),
                ),
                const SizedBox(height: 40),
                RestEyeMainButton(
                  onPressed: () {
                    controller.toggle();
                  },
                  text: '〇〇をはじめる',
                ),
                const SizedBox(
                  height: 24,
                ),
                RestEyeSubButton(
                    onPressed: () {
                      controller.toggle();
                    },
                    text: "〇〇を終わる"
                ),
                const SizedBox(
                  height: 72,
                ),
                Text.rich(
                  TextSpan(
                    text: '動画を変更する',
                    style: const TextStyle(
                      // decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                      color: AppColors.titleTextColor,
                      letterSpacing: 1.15,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                      },
                    mouseCursor: SystemMouseCursors.precise,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    RestEyeCard(text: '動画'),
                    RestEyeCard(text: '動画'),
                    RestEyeCard(text: '動画'),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 32),
                    primary: AppColors.addButtonBgColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                  ),
                  child: const Text(
                    "追加する",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.15,
                      color: AppColors.addButtonTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 56)
              ],
            ),
          ),
          Expanded(
              child: Container(
                width: double.infinity,
                height: 74.0,
                color: const Color(0xFFd9d9d9),
                child: const Text(
                  "広告バナーが入ります",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center
                ),
             )
          )],
      ),
    );
  }
}
