import 'package:shared_preferences/shared_preferences.dart';

const _key = 'usageTime';

/// ユーザの使用時間を保存する
Future<void> saveUsageTime(int usageTime) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(_key, usageTime);
}

/// ユーザの使用時間を取得
Future<int> getUsageTime() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.reload();
  return prefs.getInt(_key) ?? 0;
}
