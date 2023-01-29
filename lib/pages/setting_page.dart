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
            return const ProgressOverlay(
              inProgress: true,
              child: SizedBox.shrink(),
            );
          } else {
            final adFree = snapshot.data!;

            print(adFree);

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
                      if (isActive) ...[
                        ListTile(
                          title: Text(
                            AppLocalizations.of(context)!
                                .settingPurchasedAdFree,
                            style: const TextStyle(color: Colors.green),
                          ),
                          leading: const Icon(Icons.volunteer_activism),
                          onTap: null,
                        ),
                      ] else ...[
                        ListTile(
                          title: Text(
                              '${AppLocalizations.of(context)!.settingAdFree} ${adFree.storeProduct.priceString}'),
                          leading: const Icon(Icons.volunteer_activism),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () => _purchase(context),
                        ),
                        ListTile(
                          title: Text(
                            AppLocalizations.of(context)!
                                .settingPurchasedRestore,
                          ),
                          leading: const Icon(Icons.cloud_sync),
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
  Future<void> _purchase(BuildContext context) async {
    try {
      setState(() {
        _isValidating = true;
      });

      await RestEyePurchases.purchaseAdFree();
      final isActive = await RestEyePurchases.isActive();

      if (isActive) {
        adFreeProvider.setAdFreeState(true);
      }
    } on PlatformException catch (e) {
      // 購入エラー
      _showErrorDialog(context, e);
    } finally {
      setState(() {
        _isValidating = false;
      });
    }
  }

  /// 復元
  Future<void> _restore() async {
    var isActive = false;

    try {
      setState(() {
        _isValidating = true;
      });

      await RestEyePurchases.restorePurchases();
      isActive = await RestEyePurchases.isActive();

      if (isActive) {
        adFreeProvider.setAdFreeState(true);
      }
    } on PlatformException catch (e) {
      // 購入を復元エラー
      _showErrorDialog(context, e);
    } finally {
      setState(() {
        _isValidating = false;
      });

      if (isActive) {
        // 復元成功ダイアログ
        await CupertinoDialog.show(
          context,
          AppLocalizations.of(context)!.settingPurchasedRestoreSuccessTitle,
          null,
        );
      }
    }
  }

  void _showErrorDialog(BuildContext context, PlatformException e) {
    CupertinoDialog.show(
      context,
      AppLocalizations.of(context)!.settingPurchasedErrorTitle,
      '${AppLocalizations.of(context)!.settingPurchasedErrorContent}\n${e.code}:${e.message}',
    );
  }
}
