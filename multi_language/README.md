# 🌐 Flutter Localization Setup Guide

This guide will help you set up localization (multi-language support) in your Flutter app using `.arb` files and `flutter_localizations`.

---

## ✅ Prerequisites

- Flutter SDK installed
- A new or existing Flutter project

---

## 1️⃣ Add Dependencies

Open `pubspec.yaml` and add:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  intl: ^0.19.0

flutter:
  generate: true
```

Then run:

```bash
flutter pub get
```

---

## 2️⃣ Create Localization Folder

Inside your `lib/` directory, create a folder named `l10n/`.

```bash
mkdir lib/l10n
```

---

## 3️⃣ Add ARB Files

Create the following files in `lib/l10n/`:

- `app_en.arb` (English)
- `app_vi.arb` (Vietnamese)

### `app_en.arb`

```json
{
  "@@locale": "en",
  "language": "English",
  "hello": "Hello",
  "changeLanguage": "Change Language"
}
```

### `app_vi.arb`

```json
{
  "@@locale": "vi",
  "language": "Việt Nam",
  "hello": "Xin chào",
  "changeLanguage": "Đổi ngôn ngữ"
}
```

---

## 4️⃣ Add l10n.yaml

```yaml
arb-dir: lib/l10n
template-arb-file: app_vi.arb
output-localization-file: app_localizations.dart
```

---

## 5️⃣ Generate Localization Files

Run the generator:

```bash
flutter gen-l10n
```

It will generate a file like `app_localizations.dart` in `lib/gen/` or `lib/l10n/` depending on the config.

---

## 6️⃣ Configure `MaterialApp`

In `main.dart`, import and set up localization:

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  home: MyHomePage(),
)
```

---

## 7️⃣ Use Localized Strings

Use localized text in your widgets:

```dart
Text(AppLocalizations.of(context)!.hello)
```

---

## 🎉 Done!

You’ve successfully added localization to your Flutter app. Now you can support as many languages as you want by adding more `.arb` files!
