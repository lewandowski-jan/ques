import 'localizations.dart';

/// The translations for English (`en`).
class QSLocalizationsEn extends QSLocalizations {
  QSLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Ques';

  @override
  String get sing_in_page_create_account => 'create new account';

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
  String get create_account_page_create_account_headline =>
      'Create new account';

  @override
  String get create_account_page_email => 'email';

  @override
  String get create_account_page_password => 'password';

  @override
  String get create_account_page_create_button => 'create';

  @override
  String get main_page_bottom_navigation_home => 'home';

  @override
  String get main_page_bottom_navigation_search => 'search';

  @override
  String get main_page_bottom_navigation_settings => 'settings';

  @override
  String get home_page_add_new_device => '+ add new device';

  @override
  String get home_page_greeting_morning => 'Good morning';

  @override
  String get home_page_greeting_afternoon => 'Good afternoon';

  @override
  String get home_page_greeting_evening => 'Good evening';

  @override
  String get home_page_devices => 'DEVICES';

  @override
  String get add_new_device_page_add_new_device => 'Add new device';

  @override
  String get add_new_device_page_select_device => 'SELECT DEVICE';

  @override
  String get add_new_device_page_edit_device_name => 'EDIT DEVICE NAME';

  @override
  String get add_new_device_page_select_device_type => 'SELECT DEVICE TYPE';

  @override
  String get add_new_device_page_device_exists =>
      'This device is already registered in the system';

  @override
  String get add_new_device_page_add => 'add';

  @override
  String with_placeholders(int count) {
    return 'Likes: $count';
  }
}
