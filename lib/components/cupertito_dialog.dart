import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDialog {
  CupertinoDialog._();

  static Future<void> show(
      BuildContext context, String title, String? content) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: content != null ? Text(content) : null,
          actions: [
            CupertinoDialogAction(
              child: const Text('OK', style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
