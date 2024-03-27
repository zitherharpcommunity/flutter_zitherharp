# flutter_zitherharp

A shared library used for apps of Zither Harp.

## Features
- constants
- entities
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

### Internationalizing your apps
- Create localization files *(.arb)* into `assets\locales` folder
```
app_en.arb
app_vi.arb
app_zh.arb
...
```

> [!TIP] 
> We recommend to use [Google ARB Editor](https://marketplace.visualstudio.com/items?itemName=Google.arb-editor) extension to edit the *.arb* files.

- Config the locale files like this in your `pubspec.yaml` or create a new file named `l10n.yaml`
```yaml
arb-dir: assets\locales
use-escaping: true
template-arb-file: app_vi.arb
output-localization-file: app_localizations.dart
```

- Run this command to auto-generate localization files in `.dart-tool`
```cmd
flutter gen-l10n
```
or:
```cmd
flutter gen-l10n --arb-dir=assets\locales
```

## Additional information

- [Email](zh.zitherharp@gmail.com)
- [Website](http://zitherharp.dev/)
- [Facebook](https://www.facebook.com/zitherharp/)
