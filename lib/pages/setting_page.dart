import 'package:flutter/material.dart';
import 'package:flutter_resteye/core/initialize.dart';

import 'package:url_launcher/url_launcher.dart';

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
            title: const Text('アプリを評価'),
            leading: const Icon(Icons.star),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('問い合わせ'),
            leading: const Icon(Icons.email),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => {},
          ),
          ListTile(
            title: const Text('利用規約'),
            leading: const Icon(Icons.article),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _launchInBrowser(
              Uri.parse(
                  'https://github.com/K-shir0/K-shir0/wiki/Resteye-%E5%88%A9%E7%94%A8%E8%A6%8F%E7%B4%84'),
            ),
          ),
          ListTile(
            title: const Text('プライバシーポリシー'),
            leading: const Icon(Icons.pan_tool),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => _launchInBrowser(
              Uri.parse(
                  'https://github.com/K-shir0/K-shir0/wiki/Resteye-%E3%83%97%E3%83%A9%E3%82%A4%E3%83%90%E3%82%B7%E3%83%BC%E3%83%9D%E3%83%AA%E3%82%B7%E3%83%BC'),
            ),
          ),
          const ListTile(
            title: Text('バージョン情報 0.1.0'),
          )
        ],
      ),
    );
  }
}
