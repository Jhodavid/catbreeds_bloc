
enum AppLocaleEnum {
  english,
  spanish
}

extension AppLocaleEnumExtension on AppLocaleEnum {

  String get code {
    switch(this) {
      case AppLocaleEnum.english: return 'en';
      case AppLocaleEnum.spanish: return 'es';
    }
  }

}