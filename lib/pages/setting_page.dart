import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_resteye/components/_components.dart';

import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_resteye/constants.dart';
import 'package:flutter_resteye/notifiers/ad_free_provider.dart';
import 'package:flutter_resteye/utils/_utils.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  /// 購入中, 復元中かどうかの状態
  bool _isValidating = false;

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
      body: FutureBuilder<Package?>(
        future: RestEyePurchases.getAdFree(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // TODO(k-shir): Loading 追加
            return const ProgressOverlay(
              inProgress: true,
              child: SizedBox.shrink(),
            );
          } else {
            final adFree = snapshot.data!;

            return ProgressOverlay(
              inProgress: _isValidating,
              child: ValueListenableBuilder<bool?>(
                valueListenable: adFreeProvider,
                builder: (context, value, _) {
                  final isActive = value ?? false;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isActive) ...[
                        Padding(
                          padding: EdgeInsets.fromLTRB(8.h, 8.w, 0, 8.h),
                          child: Text(
                            AppLocalizations.of(context)!.settingAdTitle,
                            style: TextStyle(fontSize: 10.sp),
                          ),
                        ),
                        SizedBox(
                          height: 118.h,
                          child: adBannerWidget,
                        ),
                      ],
                      ListTile(
                        title: Text(
                            AppLocalizations.of(context)!.settingTermsOfUse),
                        leading: const Icon(Icons.article),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () =>
                            RestEyeUrlLauncher.launchInBrowserTermsOfUse(),
                      ),
                      ListTile(
                        title: Text(
                            AppLocalizations.of(context)!.settingPrivacyPolicy),
                        leading: const Icon(Icons.pan_tool),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                        onTap: () =>
                            RestEyeUrlLauncher.launchInBrowserPrivacyPolicy(),
                      ),
                      // TODO(k-shir0): ローカライズする
                      if (isActive) ...[
                        const ListTile(
                          title: Text(
                            '広告解除 - 購入済み',
                            style: TextStyle(color: Colors.green),
                          ),
                          leading: Icon(Icons.currency_yen),
                          onTap: null,
                        ),
                      ] else ...[
                        ListTile(
                          title: Text(
                              '広告解除 ¥ ${adFree.storeProduct.price.toInt()}'),
                          leading: const Icon(Icons.currency_yen),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: _purchase,
                        ),
                        ListTile(
                          title: const Text('購入を復元'),
                          leading: const Icon(Icons.restore),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: _restore,
                        ),
                      ],
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  /// 再購入
  Future<void> _purchase() async {
    try {
      setState(() {
        _isValidating = true;
      });

      await RestEyePurchases.purchaseAdFree();
      final isActive = await RestEyePurchases.isActive();

      if (isActive) {
        adFreeProvider.setAdFreeState(true);
      }
    } on PlatformException catch (_) {
      // TODO(k-shir0): 購入エラー
    } finally {
      setState(() {
        _isValidating = false;
      });
    }
  }

  /// 復元
  Future<void> _restore() async {
    try {
      setState(() {
        _isValidating = true;
      });

      await RestEyePurchases.restorePurchases();
      final isActive = await RestEyePurchases.isActive();

      if (isActive) {
        adFreeProvider.setAdFreeState(true);
      }
    } on PlatformException catch (_) {
      // TODO(k-shir0): 購入を復元エラー
    } finally {
      setState(() {
        _isValidating = false;
      });
    }
  }
}
