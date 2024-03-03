import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

sealed class FlutterLauncher {
  /// Summons the platform's share sheet to share text.
  ///
  /// The optional [subject] parameter can be used to
  /// populate a subject if the user chooses to send an email.
  static Future<void> share(
    String text, {
    String? subject,
  }) {
    return Share.share(
      text,
      subject: subject,
    );
  }

  /// Passes [url] to the underlying platform for handling.
  static Future<bool> openUrl(String url) {
    return launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  /// Passes [email] to the underlying platform for handling.
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
