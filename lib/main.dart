import 'package:fankosh/core/localization/app_localization.dart';
import 'package:fankosh/core/style/color_manager.dart';
import 'package:fankosh/feature/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const Fankosh());
}

class Fankosh extends StatelessWidget {
  const Fankosh({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: AppLocaleController.localeNotifier,
      builder: (context, locale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: locale,
          supportedLocales: const [
            Locale('ar'),
            Locale('en'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: ThemeData(
            fontFamily: ColorManager.fontFamily,
            scaffoldBackgroundColor: ColorManager.backgroundColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: ColorManager.primaryColor,
              primary: ColorManager.primaryColor,
              surface: ColorManager.cardBackground,
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
