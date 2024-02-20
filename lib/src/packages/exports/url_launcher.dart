import 'package:url_launcher/url_launcher_string.dart';

sealed class UrlLauncher {
  static Future<bool> openUrl(String url) {
    return launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  static Future<bool> openEmail(
    String email, {
    String? subject,
    String? body,
  }) {
    return openUrl(
      'mailto:$email?subject=$subject&body=$body',
    );
  }

  static Future<bool> openGooglePlay([String? id]) {
    return openUrl(
      id != null
          ? 'https://play.google.com/store/apps/details?id=$id'
          : 'https://play.google.com/store/apps/dev?id=8774765340726147043',
    );
  }
}
