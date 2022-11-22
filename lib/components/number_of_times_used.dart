import 'package:shared_preferences/shared_preferences.dart';

const _key = "numberOfTimesUsed";

/// 使用回数を増加する
Future<void> incrementNumberOfTimesUsed() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(_key, await getNumberOfTimesUsed() + 1);
}

/// 使用回数を取得する
Future<int> getNumberOfTimesUsed() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_key) ?? 0;
}
