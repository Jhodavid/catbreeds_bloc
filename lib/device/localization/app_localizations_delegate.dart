import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:catbreeds_bloc/device/localization/app_localizations.dart';
import 'package:catbreeds_bloc/device/localization/app_localizations_enum.dart';



class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  
  const AppLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return [AppLocaleEnum.english.code, AppLocaleEnum.spanish.code].contains(locale.languageCode);
  }
  
  @override
  Future<AppLocalizations> load(Locale locale) async {
    final Map<String, dynamic> jsonMap = await rootBundle.loadStructuredData<Map<String, dynamic>>(
      'assets/languages/${locale.languageCode}.arb',
      (jsonStr) async => json.decode(jsonStr),
    );
    return AppLocalizations(locale, jsonMap);
  }
  
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;

}