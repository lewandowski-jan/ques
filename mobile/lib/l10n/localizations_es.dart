import 'localizations.dart';

/// The translations for Spanish Castilian (`es`).
class QSLocalizationsEs extends QSLocalizations {
  QSLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get app_title => 'Ques';

  @override
  String get sing_in_page_create_account => 'crear cuenta nueva';

  @override
  String get sing_in_page_sign_in_headline => 'Iniciar sesión en tu cuenta';

  @override
  String get sign_in_page_sign_in_button => 'iniciar sesión';

  @override
  String get sign_in_page_email => 'correo electrónico';

  @override
  String get sign_in_page_password => 'contraseña';

  @override
  String get sign_out_button => 'cerrar sesión';

  @override
  String get create_account_page_create_account_headline =>
      'Crear nueva cuenta';

  @override
  String get create_account_page_email => 'correo electrónico';

  @override
  String get create_account_page_password => 'contraseña';

  @override
  String get create_account_page_create_button => 'crear';

  @override
  String get main_page_bottom_navigation_home => 'inicio';

  @override
  String get main_page_bottom_navigation_search => 'búsqueda';

  @override
  String get main_page_bottom_navigation_settings => 'ajustes';

  @override
  String get home_page_add_new_device => '+ agregar nuevo dispositivo';

  @override
  String get home_page_greeting_morning => 'Buenos días';

  @override
  String get home_page_greeting_afternoon => 'Buenas tardes';

  @override
  String get home_page_greeting_evening => 'Buenas noches';

  @override
  String get home_page_devices => 'DISPOSITIVOS';

  @override
  String get add_new_device_page_add_new_device => 'Agregar nuevo dispositivo';

  @override
  String get add_new_device_page_select_device => 'SELECCIONAR DISPOSITIVO';

  @override
  String get add_new_device_page_edit_device_name =>
      'EDITAR NOMBRE DEL DISPOSITIVO';

  @override
  String get add_new_device_page_select_device_type =>
      'SELECCIONAR TIPO DE DISPOSITIVO';

  @override
  String get add_new_device_page_device_exists =>
      'Este dispositivo ya está registrado en el sistema.';

  @override
  String get add_new_device_page_add => 'agregar';

  @override
  String get account_page_account => 'Cuenta';

  @override
  String get account_page_change_name => 'Cambiar nombre';

  @override
  String get account_page_change_password => 'Cambiar contraseña';

  @override
  String get account_page_sign_out => 'Cerrar sesión';

  @override
  String get change_name_page_change_name => 'Cambiar nombre';

  @override
  String get change_name_page_name => 'nuevo nombre';

  @override
  String get change_name_page_save => 'guardar';

  @override
  String get change_password_page_change_password => 'Cambiar contraseña';

  @override
  String get change_password_page_password => 'nueva contraseña';

  @override
  String get change_password_page_confirm_password =>
      'confirmar nueva contraseña';

  @override
  String get change_password_page_save => 'guardar';

  @override
  String get settings_page_app_settings => 'Configuración de la aplicación';

  @override
  String get settings_page_battery_saving => 'Ahorro de batería';

  @override
  String get settings_page_change_language => 'Cambiar idioma';

  @override
  String get settings_page_notifications_management =>
      'Gestión de notificaciones';

  @override
  String get settings_page_information => 'Información';

  @override
  String get settings_page_privacy_notice => 'Aviso de privacidad';

  @override
  String get settings_page_acknowledgements => 'Agradecimientos';

  @override
  String get settings_page_you_are_signed_in_as => 'Has iniciado sesión como';

  @override
  String get settings_page_ques => 'Ques';

  @override
  String get devices_sorting_button_distance_increasing => 'distancia ↑';

  @override
  String get devices_sorting_button_distance_decreasing => 'distancia ↓';

  @override
  String get devices_sorting_button_last_seen => 'último visto ↑';

  @override
  String get battery_saving_page_battery_saving => 'Ahorro de batería';

  @override
  String get battery_saving_page_battery_usage_strategy =>
      'ESTRATEGIA DE USO DE BATERÍA';

  @override
  String get battery_saving_page_precision => 'precisión';

  @override
  String get battery_saving_page_accurate => 'preciso';

  @override
  String get battery_saving_page_optimal => 'óptimo';

  @override
  String get battery_saving_page_loose => 'flojo';

  @override
  String get notifications_management_page_notifications_management =>
      'Gestión de notificaciones';

  @override
  String get notifications_management_page_notifications_strategy =>
      'ESTRATEGIA DE NOTIFICACIONES';

  @override
  String get notifications_management_page_every => 'cada';

  @override
  String get notifications_management_page_one => 'una';

  @override
  String get notifications_management_page_only => 'sólo';

  @override
  String get notifications_management_page_important => 'importantes';

  @override
  String get notifications_management_page_all => 'todas';

  @override
  String get notifications_management_page_disabled => 'deshabilitadas';

  @override
  String get edit_user_device_page_something_went_wrong =>
      'Algo salió mal, por favor intente nuevamente más tarde.';

  @override
  String get edit_user_device_page_alert => 'Alerta';

  @override
  String get edit_user_device_page_are_you_sure =>
      '¿Está seguro que desea eliminar este dispositivo?';

  @override
  String get edit_user_device_page_no => 'No';

  @override
  String get edit_user_device_page_yes => 'Sí';

  @override
  String get edit_user_device_page_edit_device => 'Editar dispositivo';

  @override
  String get edit_user_device_page_save => 'guardar';

  @override
  String get edit_user_device_page_delete => 'eliminar';

  @override
  String device_tile_distance(String distance) {
    return 'dist.: $distance';
  }

  @override
  String device_tile_last_seen(String when) {
    return 'visto: $when';
  }

  @override
  String get language_en => 'Inglés';

  @override
  String get language_pl => 'Polaco';

  @override
  String get language_es => 'Español';

  @override
  String get language_page_change_language => 'Cambiar idioma';

  @override
  String get language_page_select_language => 'SELECCIONAR IDIOMA';
}
