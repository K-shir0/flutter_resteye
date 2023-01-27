import 'package:flutter/material.dart';

final adFreeProvider = _AdFreeNotifier(null);

// 広告削除が課金済みかどうかの状態を持つクラス
class _AdFreeNotifier extends ValueNotifier<bool?> {
  _AdFreeNotifier(value) : super(value);

  void setAdFreeState(bool active) {
    value = active;
    notifyListeners();
  }
}
