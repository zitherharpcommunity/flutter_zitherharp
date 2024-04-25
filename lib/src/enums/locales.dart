// ignore_for_file: constant_identifier_names

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A class represents a [Unicode Language
/// Identifier](https://www.unicode.org/reports/tr35/#Unicode_language_identifier)
/// (i.e. without Locale extensions).
sealed class Locales {
  /// Vietnamese.
  static const Locale vi = Locale('vi');

  /// English
  static const Locale en = Locale('en');

  /// Chinese.
  static const Locale zh = Locale('zh');

  /// English (US).
  static const Locale en_US = Locale('en', 'US');

  /// English (UK).
  static const Locale en_UK = Locale('en', 'UK');

  /// Vietnamese (Sino-Nom).
  static const Locale vi_VN = Locale('vi', 'VN');

  /// Chinese (Simplified).
  static const Locale zh_CN = Locale('zh', 'CN');

  /// Chinese (Traditional).
  static const Locale zh_TW = Locale('zh', 'TW');
}
