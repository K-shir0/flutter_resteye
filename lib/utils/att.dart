import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class RestEyeATT {
  RestEyeATT._();

  static void confirmATTStatus() {
    AppTrackingTransparency.requestTrackingAuthorization();
  }
}
