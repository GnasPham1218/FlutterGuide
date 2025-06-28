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

## 3️⃣ Add ARB Files and l10n.dart

Create the following files in `lib/l10n/`:

- `app_en.arb` (English)
- `app_vi.arb` (Vietnamese)
- `l10n.dart`

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

### `l10n.dart`

```dart
import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en', ''), // English
    const Locale('vi', ''), // Vietnamese
  ];
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
import 'l10n/l10n.dart';

MaterialApp(
  locale: _locale, // optional for runtime change
  supportedLocales: L10n.all,
  localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
  home: MyHomePage(),
)
```

---

## 7️⃣ Use Localized Strings

Import if you want in other pages

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
```

Use localized text in your widgets:

```dart
Text(AppLocalizations.of(context)!.hello)
```

---

## 8️⃣. Change Language at Runtime (Optional)

```dart
Implement setLocale() in MyApp and call it like this in your HomePage:
final currentLocale = Localizations.localeOf(context);
final newLocale = currentLocale.languageCode == 'vi'
    ? const Locale('en')
    : const Locale('vi');
MyApp.setLocale(context, newLocale);
```

---

## 🎉 Done!

You’ve successfully added localization to your Flutter app. Now you can support as many languages as you want by adding more `.arb` files!
