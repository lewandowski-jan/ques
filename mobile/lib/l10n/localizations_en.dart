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
      'This device is already registered in the system.';

  @override
  String get add_new_device_page_add => 'add';

  @override
  String get account_page_account => 'Account';

  @override
  String get account_page_change_name => 'Change name';

  @override
  String get account_page_change_password => 'Change password';

  @override
  String get account_page_sign_out => 'Sign out';

  @override
  String get change_name_page_change_name => 'Change name';

  @override
  String get change_name_page_name => 'new name';

  @override
  String get change_name_page_save => 'save';

  @override
  String get change_password_page_change_password => 'Change password';

  @override
  String get change_password_page_password => 'new password';

  @override
  String get change_password_page_confirm_password => 'confirm new password';

  @override
  String get change_password_page_save => 'save';

  @override
  String get settings_page_app_settings => 'App settings';

  @override
  String get settings_page_battery_saving => 'Battery saving';

  @override
  String get settings_page_change_language => 'Change language';

  @override
  String get settings_page_notifications_management =>
      'Notifications management';

  @override
  String get settings_page_information => 'Information';

  @override
  String get settings_page_privacy_notice => 'Privacy notice';

  @override
  String get settings_page_acknowledgements => 'Acknowledgements';

  @override
  String get settings_page_you_are_signed_in_as => 'You are signed in as';

  @override
  String get settings_page_ques => 'Ques';

  @override
  String get devices_sorting_button_distance_increasing => 'distance ↑';

  @override
  String get devices_sorting_button_distance_decreasing => 'distance ↓';

  @override
  String get devices_sorting_button_last_seen => 'last seen ↑';

  @override
  String get battery_saving_page_battery_saving => 'Battery saving';

  @override
  String get battery_saving_page_battery_usage_strategy =>
      'BATTERY USAGE STRATEGY';

  @override
  String get battery_saving_page_precision => 'precision';

  @override
  String get battery_saving_page_accurate => 'accurate';

  @override
  String get battery_saving_page_optimal => 'optimal';

  @override
  String get battery_saving_page_loose => 'loose';

  @override
  String get notifications_management_page_notifications_management =>
      'Notifications management';

  @override
  String get notifications_management_page_notifications_strategy =>
      'NOTIFICATIONS STRATEGY';

  @override
  String get notifications_management_page_every => 'every';

  @override
  String get notifications_management_page_one => 'one';

  @override
  String get notifications_management_page_only => 'only';

  @override
  String get notifications_management_page_important => 'important';

  @override
  String get notifications_management_page_all => 'all';

  @override
  String get notifications_management_page_disabled => 'disabled';

  @override
  String get edit_user_device_page_something_went_wrong =>
      'Something went wrong, please try again later.';

  @override
  String get edit_user_device_page_alert => 'Alert';

  @override
  String get edit_user_device_page_are_you_sure =>
      'Are you sure that you want to delete this device?';

  @override
  String get edit_user_device_page_no => 'No';

  @override
  String get edit_user_device_page_yes => 'Yes';

  @override
  String get edit_user_device_page_edit_device => 'Edit device';

  @override
  String get edit_user_device_page_save => 'save';

  @override
  String get edit_user_device_page_delete => 'delete';

  @override
  String device_tile_distance(String distance) {
    return 'dist.: $distance';
  }

  @override
  String device_tile_last_seen(String when) {
    return 'last seen: $when';
  }

  @override
  String get language_en => 'English';

  @override
  String get language_pl => 'Polish';

  @override
  String get language_es => 'Spanish';

  @override
  String get language_page_change_language => 'Change language';

  @override
  String get language_page_select_language => 'SELECT LANGUAGE';
}
