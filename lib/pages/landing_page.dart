import 'package:flutter/material.dart';

import 'package:flutter_resteye/components/_components.dart';
import 'package:flutter_resteye/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 60, 32, 72),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'スマホをやめられない方のためのドライアイ予防アプリ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                  color: AppColors.textColor,
                ),
              ),
              RestEyeMainButton(
                onPressed: () {},
                text: '〇〇をはじめる',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
