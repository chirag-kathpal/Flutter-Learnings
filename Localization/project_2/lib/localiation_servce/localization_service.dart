import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationService {
  late final Locale locale;

  LocalizationService(this.locale);

  static LocalizationService of(BuildContext context) {
    return Localizations.of(context, LocalizationService);
  }

  late Map<String, String> _localizedString;

  Future<void> load() async {
    final jsonString =
        await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    _localizedString =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  String? translate(String key) {
    return _localizedString[key];
  }

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'AR'),
  ];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale>? supportedlocale) {
    if (supportedLocales != null && locale != null) {
      return supportedLocales.firstWhere(
          (element) => element.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first);
    }
    return null;
  }

  static const LocalizationsDelegate<LocalizationService> _delegate =
      _localizationServiceDelegate();
  static const localizationDelegate = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    _delegate
  ];
}

class _localizationServiceDelegate
    extends LocalizationsDelegate<LocalizationService> {
  const _localizationServiceDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService service = LocalizationService(locale);
    await service.load();
    return service;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<LocalizationService> old) {
    return false;
  }
}
