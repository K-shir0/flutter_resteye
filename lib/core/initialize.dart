import 'package:shared_preferences/shared_preferences.dart';

const _key = 'initializedStatus';

Future<void> saveInitializeStatus(bool initializedStats) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(_key, initializedStats);
}

Future<bool> getInitializeStatus() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_key) ?? false;
}
