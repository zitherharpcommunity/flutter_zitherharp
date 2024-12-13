// ignore_for_file: constant_identifier_names

import 'package:flutter_zitherharp/flutter_zitherharp.dart';

/// A class represents a [Unicode Language
/// Identifier](https://www.unicode.org/reports/tr35/#Unicode_language_identifier)
/// (i.e. without Locale extensions).
sealed class Locales {
  static final List<Locale> values = [
    vi,
    en,
    zh,
    en_US,
    en_UK,
    vi_HN,
    vi_HV,
    zh_CN,
    zh_TW,
  ];

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

  /// Vietnamese (Han-Nom).
  static const Locale vi_HN = Locale('vi', 'HN');

  /// Vietnamese (Han-Viet).
  static const Locale vi_HV = Locale('vi', 'HV');

  /// Chinese (Simplified).
  static const Locale zh_CN = Locale('zh', 'CN');

  /// Chinese (Traditional).
  static const Locale zh_TW = Locale('zh', 'TW');
}
