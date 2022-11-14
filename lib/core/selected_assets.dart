import 'package:shared_preferences/shared_preferences.dart';

const _key = 'selectedAssets';

/// アセットの番号を保存する
Future<void> saveSelectedAssetsNumber(int number) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(_key, number);
}

/// アセットの番号を取得する
Future<int> getSelectedAssetsNumber() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(_key) ?? 0;
}
