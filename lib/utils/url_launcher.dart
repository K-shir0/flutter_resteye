import 'package:url_launcher/url_launcher.dart';

class RestEyeUrlLauncher {
  RestEyeUrlLauncher._();

  static Future<void> _launchInBrowser(String url) async {
    if (await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchInBrowserTermsOfUse() async {
    _launchInBrowser(
        'https://github.com/K-shir0/K-shir0/wiki/Resteye-%E5%88%A9%E7%94%A8%E8%A6%8F%E7%B4%84');
  }

  static Future<void> launchInBrowserPrivacyPolicy() async {
    _launchInBrowser(
        'https://github.com/K-shir0/K-shir0/wiki/Resteye-%E3%83%97%E3%83%A9%E3%82%A4%E3%83%90%E3%82%B7%E3%83%BC%E3%83%9D%E3%83%AA%E3%82%B7%E3%83%BC');
  }
}
