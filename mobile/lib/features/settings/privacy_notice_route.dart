import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/language/language_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class PrivacyNoticeRoute extends MaterialPageRoute<void> {
  PrivacyNoticeRoute()
      : super(
          builder: (context) => const PrivacyNoticeScreen(),
        );
}

class PrivacyNoticeScreen extends HookWidget {
  const PrivacyNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = context.l10n.getPrivacyPolicy(
      context.read<LanguageCubit>().state,
    );

    return Scaffold(
      appBar: const QSAppBar(),
      backgroundColor: context.colors.background,
      body: Markdown(
        data: data,
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 48,
        ),
        styleSheet: MarkdownStyleSheet(
          h1: context.textTheme.titleLarge,
          h2: context.textTheme.titleMedium,
          p: context.textTheme.bodySmall,
        ),
      ),
    );
  }
}
