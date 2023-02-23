import 'localizations.dart';

/// The translations for English (`en`).
class QSLocalizationsEn extends QSLocalizations {
  QSLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Ques';

  @override
  String get sing_in_page_sign_in_headline => 'Sign in to your account';

  @override
  String get sign_in_page_sign_in_button => 'sign in';

  @override
  String get sign_in_page_email => 'email';

  @override
  String get sign_in_page_password => 'password';

  @override
  String get sign_out_button => 'sign out';

  @override
  String with_placeholders(int count) {
    return 'Likes: $count';
  }
}
