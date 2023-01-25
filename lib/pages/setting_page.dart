import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/utils/url_launcher.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final _banner = BannerAd(
    size: AdSize.banner,
    adUnitId: kAdUnitIdIndexBottom,
    listener: const BannerAdListener(),
    request: const AdRequest(),
  );

  @override
  void dispose() {
    _banner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _banner.load();

    final adBannerWidget = AdWidget(ad: _banner);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingAppBar),
        backgroundColor: AppColors.settingAppBarColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8.h, 8.w, 0, 8.h),
            child: Text(
              '広告',
              style: TextStyle(fontSize: 10.sp),
            ),
          ),
          SizedBox(
            height: 118.h,
            child: adBannerWidget,
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingTermsOfUse),
            leading: const Icon(Icons.article),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () => RestEyeUrlLauncher.launchInBrowserTermsOfUse(),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingPrivacyPolicy),
            leading: const Icon(Icons.pan_tool),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () => RestEyeUrlLauncher.launchInBrowserPrivacyPolicy(),
          ),
        ],
      ),
    );
  }
}
