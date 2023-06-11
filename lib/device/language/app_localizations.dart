
import 'dart:convert';
// ignore: unused_import, depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:catbreeds_bloc/device/language/app_localizations_delegate.dart';



class AppLocalizations {

  final Locale locale;
  final Map<String, dynamic> _localizedStrings;

  AppLocalizations(this.locale ,this._localizedStrings);

  static Future<AppLocalizations> load(Locale locale) async {
    final Map<String, dynamic> jsonMap = await rootBundle.loadStructuredData(
      'assets/language/${locale.languageCode}.arb',
      (jsonStr) async => json.decode(jsonStr)
    );
    return AppLocalizations(locale ,jsonMap);
  }

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  //String instances

  String get appName => _localizedStrings['app_name'];

  // String hello(String name) => Intl.message(
  //   '$name says hello!',
  //   name: 'hello',
  //   args: [name],
  //   locale: locale.toString(),
  // );

  BreedsModuleStrings get breedsModule => BreedsModuleStrings(_localizedStrings['breeds_module']);
  DetailModuleStrings get detailModule => DetailModuleStrings(_localizedStrings['detail_module']);

}


class BreedsModuleStrings {

  final Map<String, dynamic> _localizedStrings;

  BreedsModuleStrings(this._localizedStrings);

  String get mDefault => _localizedStrings['default'];
  String get title => _localizedStrings['title'];
  String get searchInputHint => _localizedStrings['search_input_hint'];
  String get readMore => _localizedStrings['read_more'];
  String get intelligence => _localizedStrings['intelligence'];
  String intelligenceTooltipMessage(int rate) {
    String text = _localizedStrings['intelligence_tooltip_message'];
    text = text.replaceAll('[rate]', rate.toString());
    text = text.replaceAll('[total]', '5');
    return text;
  }

}

class DetailModuleStrings {

  final Map<String, dynamic> _localizedStrings;

  DetailModuleStrings(this._localizedStrings);

  String get mDefault => _localizedStrings['default'];

}