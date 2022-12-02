import 'package:shared_preferences/shared_preferences.dart';

const _key = 'lastUsedTime';

/// 最終使用時間を保存する
Future<void> saveLastUsedTime() async {
  final prefs = await SharedPreferences.getInstance();
  final today = DateTime.now();
  final todayZero = DateTime(today.year, today.month, today.day);
  prefs.setInt(_key, todayZero.millisecondsSinceEpoch);
}

/// 最終使用時間を取得
Future<DateTime> getLastUsedTime() async {
  final prefs = await SharedPreferences.getInstance();
  return DateTime.fromMillisecondsSinceEpoch(prefs.getInt(_key) ?? 0);
}
