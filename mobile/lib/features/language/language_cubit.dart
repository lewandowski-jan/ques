import 'package:flutter/widgets.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ques/l10n/l10n.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  static const availableLocales = QSLocalizations.supportedLocales;

  void change(Locale newLocale) {
    assert(availableLocales.contains(newLocale));

    Jiffy.locale(newLocale.languageCode);
    emit(newLocale);
  }

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    return Locale(json['locale'] as String);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return <String, String>{'locale': state.languageCode};
  }
}
