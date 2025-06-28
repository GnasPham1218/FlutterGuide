import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'main.dart'; // để gọi MyApp.setLocale

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(loc.hello, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Đổi giữa tiếng Anh và Việt
                final currentLocale = Localizations.localeOf(context);
                final newLocale =
                    currentLocale.languageCode == 'vi'
                        ? const Locale('en')
                        : const Locale('vi');
                MyApp.setLocale(context, newLocale);
              },
              child: Text(loc.changeLanguage),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
