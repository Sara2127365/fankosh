import 'package:fankosh/core/localization/app_strings.dart';
import 'package:fankosh/core/localization/ar_strings.dart';
import 'package:fankosh/core/localization/en_strings.dart';
import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  static final Map<String, AppStrings> _strings = {
    'ar': ArStrings(),
    'en': EnStrings(),
  };

  static AppStrings of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return _strings[locale.languageCode] ?? _strings['ar']!;
  }

  static AppStrings get current {
    return _strings[AppLocaleController.currentLocale.languageCode] ?? _strings['ar']!;
  }
}

class AppLocaleController {
  static final ValueNotifier<Locale> localeNotifier =
      ValueNotifier<Locale>(const Locale('ar'));

  static Locale get currentLocale => localeNotifier.value;

  static bool get isArabic => currentLocale.languageCode == 'ar';

  static void changeLocale(Locale newLocale) {
    if (newLocale.languageCode == 'ar' || newLocale.languageCode == 'en') {
      localeNotifier.value = newLocale;
    }
  }

  static void toggleLocale() {
    if (isArabic) {
      changeLocale(const Locale('en'));
    } else {
      changeLocale(const Locale('ar'));
    }
  }
}

extension AppLocalizationExtension on BuildContext {
  AppStrings get tr => AppLocalization.of(this);
}
