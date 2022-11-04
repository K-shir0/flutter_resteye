import 'package:firebase_analytics/firebase_analytics.dart';

void logPictureInPictureToggleEvent() async {
  await FirebaseAnalytics.instance.logEvent(
    name: "picture_in_picture_toggle",
    parameters: {},
  );
}
