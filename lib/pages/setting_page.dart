import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resteye/core/initialize.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('設定リセット（デバッグ）'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => saveInitializeStatus(false),
          ),
        ],
      ),
    );
  }
}
