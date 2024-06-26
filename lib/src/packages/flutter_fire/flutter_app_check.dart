import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// The entry point for accessing [FirebaseAppCheck].
sealed class FlutterAppCheck {
  static final FirebaseAppCheck _appCheck = FirebaseAppCheck.instance;

  static const AppleProvider _appleProvider =
      kDebugMode ? AppleProvider.debug : AppleProvider.deviceCheck;

  static const AndroidProvider _androidProvider =
      kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity;

  static dynamic _getWebProvider(
    String? recaptchaSiteKey,
    String? recaptchaEnterpriseSiteKey,
  ) {
    if (!kIsWeb ||
        recaptchaSiteKey == null ||
        recaptchaEnterpriseSiteKey == null) {
      return null;
    }
    return kDebugMode
        ? ReCaptchaV3Provider(recaptchaSiteKey)
        : ReCaptchaEnterpriseProvider(recaptchaEnterpriseSiteKey);
  }

  static const String recaptchaSiteKey = 'recaptchaSiteKey';

  static const String recaptchaEnterpriseSiteKey = 'recaptchaEnterpriseSiteKey';

  /// Activates the [FirebaseAppCheck] service.
  static Future<void> ensureInitialized({
    String? recaptchaSiteKey,
    String? recaptchaEnterpriseSiteKey,
  }) async {
    return _appCheck.activate(
      appleProvider: _appleProvider,
      androidProvider: _androidProvider,
      webProvider: _getWebProvider(
        recaptchaSiteKey,
        recaptchaEnterpriseSiteKey,
      ),
    );
  }
}
