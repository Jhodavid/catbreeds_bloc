
import 'dart:convert';
// ignore: unused_import, depend_on_referenced_packages
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:catbreeds_bloc/device/localization/app_localizations_delegate.dart';



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


  String get appName => _localizedStrings['app_name'];
  String get noImageFound => _localizedStrings['no_iamge_found'];


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
  String get searchCatBreeds => _localizedStrings['search_cat_breeds'];
  String get networkError => _localizedStrings['network_error'];
  String get noResult => _localizedStrings['no_result'];
  String get refresh => _localizedStrings['refresh'];

}

class DetailModuleStrings {

  final Map<String, dynamic> _localizedStrings;

  DetailModuleStrings(this._localizedStrings);

  String get mDefault => _localizedStrings['default'];
  String get countryOrigin => _localizedStrings['country_origin'];
  String get lifetime => _localizedStrings['lifetime'];
  String get years => _localizedStrings['years'];
  String get weight => _localizedStrings['weight'];
  String characteristicsTooltipMessage(int rate) {
    String text = _localizedStrings['characteristics_tooltip_message'];
    text = text.replaceAll('[rate]', rate.toString());
    text = text.replaceAll('[total]', '5');
    return text;
  }
  String get characteristicsTitle => _localizedStrings['characteristics_title'];
  String get characteristicAdaptability => _localizedStrings['characteristic_adaptability'];
  String get characteristicAffectionLevel => _localizedStrings['characteristic_affection_level'];
  String get characteristicChildFriendly => _localizedStrings['characteristic_child_friendly'];
  String get characteristicDogFriendly => _localizedStrings['characteristic_dog_friendly'];
  String get characteristicEnergyLevel => _localizedStrings['characteristic_energy_level'];
  String get characteristicGrooming => _localizedStrings['characteristic_grooming'];
  String get characteristicHealthIssues => _localizedStrings['characteristic_health_issues'];
  String get characteristicIntelligence => _localizedStrings['characteristic_intelligence'];
  String get characteristicSheddingLevel => _localizedStrings['characteristic_shedding_level'];
  String get characteristicSocialNeeds => _localizedStrings['characteristic_social_needs'];
  String get characteristicStrangerFriendly => _localizedStrings['characteristic_stranger_friendly'];
  String get characteristicVocalisation => _localizedStrings['characteristic_vocalisation'];
  String get characteristicExperimental => _localizedStrings['characteristic_experimental'];
  String get characteristicHairless => _localizedStrings['characteristic_hairless'];
  String get characteristicNatural => _localizedStrings['characteristic_natural'];
  String get characteristicRare => _localizedStrings['characteristic_rare'];
  String get characteristicRex => _localizedStrings['characteristic_rex'];
  String get characteristicSuppressedTail => _localizedStrings['characteristic_suppressed_tail'];
  String get characteristicShortLegs => _localizedStrings['characteristic_short_legs'];
  String get characteristicHypoallergenic => _localizedStrings['characteristic_hypoallergenic'];

}