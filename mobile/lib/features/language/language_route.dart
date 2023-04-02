import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/language/language_cubit.dart';
import 'package:ques/l10n/extensions.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class LanguageRoute extends MaterialPageRoute<void> {
  LanguageRoute()
      : super(
          builder: (context) => const LanguageScreen(),
        );
}

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();
    final currentLocale = languageCubit.state;

    return Scaffold(
      appBar: QSAppBar(
        title: context.l10n.language_page_change_language,
      ),
      backgroundColor: context.colors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 56),
            Center(
              child: QSText(
                context.l10n.language_page_select_language,
                style: context.textTheme.bodySmall,
              ),
            ),
            const SizedBox(height: 36),
            ...LanguageCubit.availableLocales.map(
              (locale) => ListTile(
                title: QSText(
                  context.l10n.getLanguageName(locale) ?? '',
                  style: context.textTheme.bodySmall,
                ),
                leading: Radio<Locale>(
                  value: locale,
                  groupValue: currentLocale,
                  onChanged: (locale) =>
                      locale != null ? languageCubit.change(locale) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
