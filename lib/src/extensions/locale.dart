import 'package:flutter_zitherharp/flutter_zitherharp.dart';

extension $LocaleExtension on Locale {
  String toLanguageName() {
    final tag = toLanguageTag();
    return switch (tag) {
      'vi' => 'Tiếng Việt',
      'vi-HN' => 'Tiếng Việt (Hán Nôm)',
      'vi-HV' => 'Tiếng Việt (Hán Việt)',
      'ja' => '日本語',
      'ko' => '한국어',
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
