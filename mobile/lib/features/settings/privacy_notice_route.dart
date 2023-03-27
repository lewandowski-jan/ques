import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/resources/markdown_texts.dart';
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
    return Scaffold(
      appBar: const QSAppBar(),
      backgroundColor: context.colors.background,
      body: Markdown(
        data: MarkdownTexts.privacyPolicy,
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
