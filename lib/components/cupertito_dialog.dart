import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoDialog {
  CupertinoDialog._();

  static void show(BuildContext context, String title, String content) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
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
