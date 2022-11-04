import 'package:flutter/material.dart';
import 'package:flutter_resteye/core/initialize.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  final appVersion = "0.1.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('設定リセット（デバッグ）'),
            leading: const Icon(Icons.restart_alt),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => saveInitializeStatus(false),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingRulesAgree1),
            leading: const Icon(Icons.star),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => {},
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingRulesAgree2),
            leading: const Icon(Icons.email),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => {},
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingRulesAgree3),
            leading: const Icon(Icons.article),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => _launchInBrowser(
              Uri.parse(
                  'https://github.com/K-shir0/K-shir0/wiki/Resteye-%E5%88%A9%E7%94%A8%E8%A6%8F%E7%B4%84'),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingRulesAgree4),
            leading: const Icon(Icons.pan_tool),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => _launchInBrowser(
              Uri.parse(
                  'https://github.com/K-shir0/K-shir0/wiki/Resteye-%E3%83%97%E3%83%A9%E3%82%A4%E3%83%90%E3%82%B7%E3%83%BC%E3%83%9D%E3%83%AA%E3%82%B7%E3%83%BC'),
            ),
          ),
          ListTile(
            title: Text(
                AppLocalizations.of(context)!.settingRulesAgree5 + appVersion),
          )
        ],
      ),
    );
  }
}
