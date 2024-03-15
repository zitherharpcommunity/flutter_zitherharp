# flutter_zitherharp

A shared library used for apps of Zither Harp.

## Features

- entities
- exports
- extensions
- packages
- widgets

## Usage
- Declare the package

```yaml
  flutter_zitherharp:
    git: 
      url: https://github.com/zitherharpcommunity/flutter_zitherharp.git
      ref: main
```

- Import the package

```dart
import 'package:flutter_zitherharp/flutter_zitherharp.dart';
```

- Create localization files *(.arb)* into `assets\locales` folder
```
app_en.arb
app_vi.arb
app_zh.arb
...
```

- Run this command to auto-generate localization files in `.dart-tool`
```cmd
flutter gen-l10n --arb-dir=assets\locales
```

## Additional information

- [Email](zh.zitherharp@gmail.com)
- [Website](http://zitherharp.dev/)
- [Facebook](https://www.facebook.com/zitherharp/)
