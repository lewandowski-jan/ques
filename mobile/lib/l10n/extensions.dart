import 'package:flutter/material.dart';
import 'package:ques/l10n/localizations.dart';

extension BuildContextLocalizations on BuildContext {
  QSLocalizations get l10n => QSLocalizations.of(this)!;
}
