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

  /// Chinese (Simplified).
  static const Locale zh_CN = Locale('zh', 'CN');

  /// Chinese (Traditional).
  static const Locale zh_TW = Locale('zh', 'TW');
}

extension $Locale on Locale {
  String toLanguageName() {
    final tag = toLanguageTag();
    return switch (tag) {
      'vi' => 'Tiếng Việt',
      'en' => 'English',
      'en-US' => 'English',
      'en-UK' => 'English',
      'zh' => '中文',
      'zh-CN' => '简体中文',
      'zh-TW' => '繁體中文',
      _ => tag,
    };
  }
}