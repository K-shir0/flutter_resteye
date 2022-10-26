import 'package:flutter/material.dart';

import 'package:flutter_resteye/components/_components.dart';
import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/pages/tutorial_page/tutorial_page.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(32.w, 60.h, 32.w, 36.h),
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    color: AppColors.textColor,
                  ),
                ),
                RestEyeMainButton(
                  onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const TutorialPage(),
                      duration: const Duration(milliseconds: 400),
                      isIos: true,
                    ),
                  ),
                  text: AppLocalizations.of(context)!.startButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
