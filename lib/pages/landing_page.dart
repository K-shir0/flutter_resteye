import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_resteye/components/_components.dart';
import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/pages/tutorial_page/tutorial_page.dart';
import 'package:flutter_resteye/utils/_utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

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
                Column(
                  children: [
                    SizedBox(height: 120.h),
                    SvgPicture.asset(
                      "assets/svg_images/logo.svg",
                      fit: BoxFit.scaleDown,
                    ),
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                        children: [
                          TextSpan(
                              text: AppLocalizations.of(context)!.rulesAgree1),
                          TextSpan(
                            text: AppLocalizations.of(context)!.rulesAgree2,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => RestEyeUrlLauncher
                                  .launchInBrowserTermsOfUse(),
                          ),
                          TextSpan(
                              text: AppLocalizations.of(context)!.rulesAgree3),
                          TextSpan(
                            text: AppLocalizations.of(context)!.rulesAgree4,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => RestEyeUrlLauncher
                                  .launchInBrowserPrivacyPolicy(),
                          ),
                          TextSpan(
                              text: AppLocalizations.of(context)!.rulesAgree5),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
