import 'localizations.dart';

/// The translations for English (`en`).
class QSLocalizationsEn extends QSLocalizations {
  QSLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Ques';

  @override
  String with_placeholders(int count) {
    return 'Likes: $count';
  }
}
