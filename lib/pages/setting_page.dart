import 'package:flutter/material.dart';
import 'package:flutter_resteye/core/initialize.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_resteye/utils/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
            title: Text(AppLocalizations.of(context)!.settingTermsOfUse),
            leading: const Icon(Icons.article),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => RestEyeUrlLancher.launchInBrowserTermsOfUse(),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.settingPrivacyPolicy),
            leading: const Icon(Icons.pan_tool),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
            onTap: () => RestEyeUrlLancher.launchInBrowserPrivacyPolicy(),
          ),
        ],
      ),
    );
  }
}
