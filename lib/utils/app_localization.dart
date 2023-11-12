import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// class to translate app words and loading files json to languages
class AppLocalization {
  final Locale? local;

  AppLocalization({required this.local});

// to provide context to calss appLocalization
  static AppLocalization? of(BuildContext context) {
    // to flutter this class to localization because this class doesn't extend any localization
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegte =
      AppLocalizationDelegte();

  late Map<String, String> _localizationMap;

// to load language files
  Future loadFiles() async {
    String jsonString = await rootBundle
        .loadString('assets/language/${local!.languageCode}.json');
    Map<String, dynamic> mapJson = json.decode(jsonString);
    _localizationMap = mapJson.map((key, value) {
      return MapEntry(key, value.toString());
    });
  }

// to translate by use key
  String translate(String key) => _localizationMap[key] ?? "";
}

extension TransletX on String {
  String tr(BuildContext context) {
    return AppLocalization.of(context)!.translate(this);
  }
}

// class to delegte
class AppLocalizationDelegte extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegte();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(local: locale);
    await appLocalization.loadFiles();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
