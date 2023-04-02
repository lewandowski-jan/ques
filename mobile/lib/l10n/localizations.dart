import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localizations_en.dart';
import 'localizations_es.dart';
import 'localizations_pl.dart';

/// Callers can lookup localized strings with an instance of QSLocalizations
/// returned by `QSLocalizations.of(context)`.
///
/// Applications need to include `QSLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: QSLocalizations.localizationsDelegates,
///   supportedLocales: QSLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the QSLocalizations.supportedLocales
/// property.
abstract class QSLocalizations {
  QSLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static QSLocalizations? of(BuildContext context) {
    return Localizations.of<QSLocalizations>(context, QSLocalizations);
  }

  static const LocalizationsDelegate<QSLocalizations> delegate =
      _QSLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pl')
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Ques'**
  String get app_title;

  /// No description provided for @sing_in_page_create_account.
  ///
  /// In en, this message translates to:
  /// **'create new account'**
  String get sing_in_page_create_account;

  /// No description provided for @sing_in_page_sign_in_headline.
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get sing_in_page_sign_in_headline;

  /// No description provided for @sign_in_page_sign_in_button.
  ///
  /// In en, this message translates to:
  /// **'sign in'**
  String get sign_in_page_sign_in_button;

  /// No description provided for @sign_in_page_email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get sign_in_page_email;

  /// No description provided for @sign_in_page_password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get sign_in_page_password;

  /// No description provided for @sign_out_button.
  ///
  /// In en, this message translates to:
  /// **'sign out'**
  String get sign_out_button;

  /// No description provided for @create_account_page_create_account_headline.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get create_account_page_create_account_headline;

  /// No description provided for @create_account_page_email.
  ///
  /// In en, this message translates to:
  /// **'email'**
  String get create_account_page_email;

  /// No description provided for @create_account_page_password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get create_account_page_password;

  /// No description provided for @create_account_page_create_button.
  ///
  /// In en, this message translates to:
  /// **'create'**
  String get create_account_page_create_button;

  /// No description provided for @main_page_bottom_navigation_home.
  ///
  /// In en, this message translates to:
  /// **'home'**
  String get main_page_bottom_navigation_home;

  /// No description provided for @main_page_bottom_navigation_search.
  ///
  /// In en, this message translates to:
  /// **'search'**
  String get main_page_bottom_navigation_search;

  /// No description provided for @main_page_bottom_navigation_settings.
  ///
  /// In en, this message translates to:
  /// **'settings'**
  String get main_page_bottom_navigation_settings;

  /// No description provided for @home_page_add_new_device.
  ///
  /// In en, this message translates to:
  /// **'+ add new device'**
  String get home_page_add_new_device;

  /// No description provided for @home_page_greeting_morning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get home_page_greeting_morning;

  /// No description provided for @home_page_greeting_afternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get home_page_greeting_afternoon;

  /// No description provided for @home_page_greeting_evening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get home_page_greeting_evening;

  /// No description provided for @home_page_devices.
  ///
  /// In en, this message translates to:
  /// **'DEVICES'**
  String get home_page_devices;

  /// No description provided for @add_new_device_page_add_new_device.
  ///
  /// In en, this message translates to:
  /// **'Add new device'**
  String get add_new_device_page_add_new_device;

  /// No description provided for @add_new_device_page_select_device.
  ///
  /// In en, this message translates to:
  /// **'SELECT DEVICE'**
  String get add_new_device_page_select_device;

  /// No description provided for @add_new_device_page_edit_device_name.
  ///
  /// In en, this message translates to:
  /// **'EDIT DEVICE NAME'**
  String get add_new_device_page_edit_device_name;

  /// No description provided for @add_new_device_page_select_device_type.
  ///
  /// In en, this message translates to:
  /// **'SELECT DEVICE TYPE'**
  String get add_new_device_page_select_device_type;

  /// No description provided for @add_new_device_page_device_exists.
  ///
  /// In en, this message translates to:
  /// **'This device is already registered in the system.'**
  String get add_new_device_page_device_exists;

  /// No description provided for @add_new_device_page_add.
  ///
  /// In en, this message translates to:
  /// **'add'**
  String get add_new_device_page_add;

  /// No description provided for @account_page_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account_page_account;

  /// No description provided for @account_page_change_name.
  ///
  /// In en, this message translates to:
  /// **'Change name'**
  String get account_page_change_name;

  /// No description provided for @account_page_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get account_page_change_password;

  /// No description provided for @account_page_sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get account_page_sign_out;

  /// No description provided for @change_name_page_change_name.
  ///
  /// In en, this message translates to:
  /// **'Change name'**
  String get change_name_page_change_name;

  /// No description provided for @change_name_page_name.
  ///
  /// In en, this message translates to:
  /// **'new name'**
  String get change_name_page_name;

  /// No description provided for @change_name_page_save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get change_name_page_save;

  /// No description provided for @change_password_page_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get change_password_page_change_password;

  /// No description provided for @change_password_page_password.
  ///
  /// In en, this message translates to:
  /// **'new password'**
  String get change_password_page_password;

  /// No description provided for @change_password_page_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'confirm new password'**
  String get change_password_page_confirm_password;

  /// No description provided for @change_password_page_save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get change_password_page_save;

  /// No description provided for @settings_page_app_settings.
  ///
  /// In en, this message translates to:
  /// **'App settings'**
  String get settings_page_app_settings;

  /// No description provided for @settings_page_battery_saving.
  ///
  /// In en, this message translates to:
  /// **'Battery saving'**
  String get settings_page_battery_saving;

  /// No description provided for @settings_page_change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get settings_page_change_language;

  /// No description provided for @settings_page_notifications_management.
  ///
  /// In en, this message translates to:
  /// **'Notifications management'**
  String get settings_page_notifications_management;

  /// No description provided for @settings_page_information.
  ///
  /// In en, this message translates to:
  /// **'Information'**
  String get settings_page_information;

  /// No description provided for @settings_page_privacy_notice.
  ///
  /// In en, this message translates to:
  /// **'Privacy notice'**
  String get settings_page_privacy_notice;

  /// No description provided for @settings_page_acknowledgements.
  ///
  /// In en, this message translates to:
  /// **'Acknowledgements'**
  String get settings_page_acknowledgements;

  /// No description provided for @settings_page_you_are_signed_in_as.
  ///
  /// In en, this message translates to:
  /// **'You are signed in as'**
  String get settings_page_you_are_signed_in_as;

  /// No description provided for @settings_page_ques.
  ///
  /// In en, this message translates to:
  /// **'Ques'**
  String get settings_page_ques;

  /// No description provided for @devices_sorting_button_distance_increasing.
  ///
  /// In en, this message translates to:
  /// **'distance ↑'**
  String get devices_sorting_button_distance_increasing;

  /// No description provided for @devices_sorting_button_distance_decreasing.
  ///
  /// In en, this message translates to:
  /// **'distance ↓'**
  String get devices_sorting_button_distance_decreasing;

  /// No description provided for @devices_sorting_button_last_seen.
  ///
  /// In en, this message translates to:
  /// **'last seen ↑'**
  String get devices_sorting_button_last_seen;

  /// No description provided for @battery_saving_page_battery_saving.
  ///
  /// In en, this message translates to:
  /// **'Battery saving'**
  String get battery_saving_page_battery_saving;

  /// No description provided for @battery_saving_page_battery_usage_strategy.
  ///
  /// In en, this message translates to:
  /// **'BATTERY USAGE STRATEGY'**
  String get battery_saving_page_battery_usage_strategy;

  /// No description provided for @battery_saving_page_precision.
  ///
  /// In en, this message translates to:
  /// **'precision'**
  String get battery_saving_page_precision;

  /// No description provided for @battery_saving_page_accurate.
  ///
  /// In en, this message translates to:
  /// **'accurate'**
  String get battery_saving_page_accurate;

  /// No description provided for @battery_saving_page_optimal.
  ///
  /// In en, this message translates to:
  /// **'optimal'**
  String get battery_saving_page_optimal;

  /// No description provided for @battery_saving_page_loose.
  ///
  /// In en, this message translates to:
  /// **'loose'**
  String get battery_saving_page_loose;

  /// No description provided for @notifications_management_page_notifications_management.
  ///
  /// In en, this message translates to:
  /// **'Notifications management'**
  String get notifications_management_page_notifications_management;

  /// No description provided for @notifications_management_page_notifications_strategy.
  ///
  /// In en, this message translates to:
  /// **'NOTIFICATIONS STRATEGY'**
  String get notifications_management_page_notifications_strategy;

  /// No description provided for @notifications_management_page_every.
  ///
  /// In en, this message translates to:
  /// **'every'**
  String get notifications_management_page_every;

  /// No description provided for @notifications_management_page_one.
  ///
  /// In en, this message translates to:
  /// **'one'**
  String get notifications_management_page_one;

  /// No description provided for @notifications_management_page_only.
  ///
  /// In en, this message translates to:
  /// **'only'**
  String get notifications_management_page_only;

  /// No description provided for @notifications_management_page_important.
  ///
  /// In en, this message translates to:
  /// **'important'**
  String get notifications_management_page_important;

  /// No description provided for @notifications_management_page_all.
  ///
  /// In en, this message translates to:
  /// **'all'**
  String get notifications_management_page_all;

  /// No description provided for @notifications_management_page_disabled.
  ///
  /// In en, this message translates to:
  /// **'disabled'**
  String get notifications_management_page_disabled;

  /// No description provided for @edit_user_device_page_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong, please try again later.'**
  String get edit_user_device_page_something_went_wrong;

  /// No description provided for @edit_user_device_page_alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get edit_user_device_page_alert;

  /// No description provided for @edit_user_device_page_are_you_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure that you want to delete this device?'**
  String get edit_user_device_page_are_you_sure;

  /// No description provided for @edit_user_device_page_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get edit_user_device_page_no;

  /// No description provided for @edit_user_device_page_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get edit_user_device_page_yes;

  /// No description provided for @edit_user_device_page_edit_device.
  ///
  /// In en, this message translates to:
  /// **'Edit device'**
  String get edit_user_device_page_edit_device;

  /// No description provided for @edit_user_device_page_save.
  ///
  /// In en, this message translates to:
  /// **'save'**
  String get edit_user_device_page_save;

  /// No description provided for @edit_user_device_page_delete.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get edit_user_device_page_delete;

  /// No description provided for @device_tile_distance.
  ///
  /// In en, this message translates to:
  /// **'dist.: {distance}'**
  String device_tile_distance(String distance);

  /// No description provided for @device_tile_last_seen.
  ///
  /// In en, this message translates to:
  /// **'last seen: {when}'**
  String device_tile_last_seen(String when);

  /// No description provided for @language_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language_en;

  /// No description provided for @language_pl.
  ///
  /// In en, this message translates to:
  /// **'Polish'**
  String get language_pl;

  /// No description provided for @language_es.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get language_es;

  /// No description provided for @language_page_change_language.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get language_page_change_language;

  /// No description provided for @language_page_select_language.
  ///
  /// In en, this message translates to:
  /// **'SELECT LANGUAGE'**
  String get language_page_select_language;
}

class _QSLocalizationsDelegate extends LocalizationsDelegate<QSLocalizations> {
  const _QSLocalizationsDelegate();

  @override
  Future<QSLocalizations> load(Locale locale) {
    return SynchronousFuture<QSLocalizations>(lookupQSLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_QSLocalizationsDelegate old) => false;
}

QSLocalizations lookupQSLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return QSLocalizationsEn();
    case 'es':
      return QSLocalizationsEs();
    case 'pl':
      return QSLocalizationsPl();
  }

  throw FlutterError(
      'QSLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
