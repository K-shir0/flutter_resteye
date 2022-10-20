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

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PinPController();

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingPage(),
                          ),
                        ),
                        child: const Icon(Icons.settings),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TutorialPage(),
                            )),
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
                          Container(
                            color: AppColors.pinpBgColor,
                            child: GestureDetector(
                              onLongPress: () {
                                HapticFeedback.heavyImpact();
                                controller.toggle();
                              },
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight: 152.h, maxWidth: 304.w),
                                child: const PinPView(),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          RestEyeMainButton(
                            onPressed: () => controller.toggle(),
                            text: AppLocalizations.of(context)!.startButton,
                          ),
                          SizedBox(height: 24.h),
                          RestEyeSubButton(
                            onPressed: () => controller.toggle(),
                            text: AppLocalizations.of(context)!.endButton,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () => {},
                            child: Text(
                                AppLocalizations.of(context)!.changeVideoButton,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titleTextColor,
                                  letterSpacing: 1.15,
                                  fontSize: 16.sp,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestEyeCard(
                                  text: AppLocalizations.of(context)!.video),
                              RestEyeCard(
                                  text: AppLocalizations.of(context)!.video),
                              RestEyeCard(
                                  text: AppLocalizations.of(context)!.video),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(120.w, 32.h),
                              backgroundColor: AppColors.addButtonBgColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.addButton,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.15,
                                color: AppColors.addButtonTextColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 32.h),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 74.0.h,
                color: AppColors.adBgColor,
                child: Text(AppLocalizations.of(context)!.ad,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ),
      ),
    );
  }
}
