import 'localizations.dart';

/// The translations for Polish (`pl`).
class QSLocalizationsPl extends QSLocalizations {
  QSLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get app_title => 'Ques';

  @override
  String get sing_in_page_create_account => 'utwórz konto';

  @override
  String get sing_in_page_sign_in_headline => 'Zaloguj się na konto';

  @override
  String get sign_in_page_sign_in_button => 'zaloguj się';

  @override
  String get sign_in_page_email => 'email';

  @override
  String get sign_in_page_password => 'hasło';

  @override
  String get sign_out_button => 'wyloguj się';

  @override
  String get create_account_page_create_account_headline => 'Utwórz konto';

  @override
  String get create_account_page_email => 'email';

  @override
  String get create_account_page_password => 'hasło';

  @override
  String get create_account_page_create_button => 'utwórz';

  @override
  String get main_page_bottom_navigation_home => 'dom';

  @override
  String get main_page_bottom_navigation_search => 'szukaj';

  @override
  String get main_page_bottom_navigation_settings => 'ustawienia';

  @override
  String get home_page_add_new_device => '+ dodaj urządzenie';

  @override
  String get home_page_greeting_morning => 'Dzień dobry';

  @override
  String get home_page_greeting_afternoon => 'Dzień dobry';

  @override
  String get home_page_greeting_evening => 'Dobry wieczór';

  @override
  String get home_page_devices => 'URZĄDZENIA';

  @override
  String get add_new_device_page_add_new_device => 'Dodaj urządzenie';

  @override
  String get add_new_device_page_select_device => 'WYBIERZ URZĄDZENIE';

  @override
  String get add_new_device_page_edit_device_name => 'WYBIERZ NAZWĘ URZĄDZENIA';

  @override
  String get add_new_device_page_select_device_type =>
      'WYBIERZ RODZAJ URZĄDZENIA';

  @override
  String get add_new_device_page_device_exists =>
      'To urządzenie zostało już zarejestrowane';

  @override
  String get add_new_device_page_add => 'dodaj';

  @override
  String get account_page_account => 'Konto';

  @override
  String get account_page_change_name => 'Zmień imię';

  @override
  String get account_page_change_password => 'Zmień hasło';

  @override
  String get account_page_sign_out => 'Wyloguj się';

  @override
  String get change_name_page_change_name => 'Zmień imię';

  @override
  String get change_name_page_name => 'nowe imię';

  @override
  String get change_name_page_save => 'zapisz';

  @override
  String get change_password_page_change_password => 'Zmień hasło';

  @override
  String get change_password_page_password => 'nowe hasło';

  @override
  String get change_password_page_confirm_password => 'zatwierdź hasło';

  @override
  String get change_password_page_save => 'zapisz';

  @override
  String get settings_page_app_settings => 'Ustawienia aplikacji';

  @override
  String get settings_page_battery_saving => 'Oszczędzanie baterii';

  @override
  String get settings_page_change_language => 'Zmiana języka';

  @override
  String get settings_page_notifications_management =>
      'Zarządzanie powiadomieniami';

  @override
  String get settings_page_information => 'Informacje';

  @override
  String get settings_page_privacy_notice => 'Polityka prywatności';

  @override
  String get settings_page_acknowledgements => 'Licencje';

  @override
  String get settings_page_you_are_signed_in_as => 'Jesteś zalgowany jako';

  @override
  String get settings_page_ques => 'Ques';

  @override
  String get devices_sorting_button_distance_increasing => 'dystans ↑';

  @override
  String get devices_sorting_button_distance_decreasing => 'dystans ↓';

  @override
  String get devices_sorting_button_last_seen => 'ostatnio widziane ↑';

  @override
  String get battery_saving_page_battery_saving => 'Oszczędzanie baterii';

  @override
  String get battery_saving_page_battery_usage_strategy =>
      'STRATEGIA ZUŻYCIA BATERII';

  @override
  String get battery_saving_page_precision => 'precyzja';

  @override
  String get battery_saving_page_accurate => 'dokładna';

  @override
  String get battery_saving_page_optimal => 'optymalna';

  @override
  String get battery_saving_page_loose => 'luźna';

  @override
  String get notifications_management_page_notifications_management =>
      'Zarządzanie powiadomieniami';

  @override
  String get notifications_management_page_notifications_strategy =>
      'STRATEGIA POWIADOMIEŃ';

  @override
  String get notifications_management_page_every => 'każde';

  @override
  String get notifications_management_page_one => 'powiadomienie';

  @override
  String get notifications_management_page_only => 'tylko';

  @override
  String get notifications_management_page_important => 'ważne';

  @override
  String get notifications_management_page_all => 'wyłączone';

  @override
  String get notifications_management_page_disabled => 'powiadomienia';

  @override
  String get edit_user_device_page_something_went_wrong =>
      'Coś poszło nie tak, spróbuj ponownie później.';

  @override
  String get edit_user_device_page_alert => 'Uwaga';

  @override
  String get edit_user_device_page_are_you_sure =>
      'Czy na pewno usunąć to urządzenie?';

  @override
  String get edit_user_device_page_no => 'Nie';

  @override
  String get edit_user_device_page_yes => 'Tak';

  @override
  String get edit_user_device_page_edit_device => 'Edytuj urządzenie';

  @override
  String get edit_user_device_page_save => 'zapisz';

  @override
  String get edit_user_device_page_delete => 'usuń';

  @override
  String device_tile_distance(String distance) {
    return 'dyst.: $distance';
  }

  @override
  String device_tile_last_seen(String when) {
    return 'widziane: $when';
  }

  @override
  String get language_en => 'Angielski';

  @override
  String get language_pl => 'Polski';

  @override
  String get language_es => 'Hiszpański';

  @override
  String get language_page_change_language => 'Zmiana języka';

  @override
  String get language_page_select_language => 'WYBIERZ JĘZYK';
}
