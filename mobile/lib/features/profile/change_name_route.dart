import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class ChangeNameRoute extends MaterialPageRoute<void> {
  ChangeNameRoute({String? initialName})
      : super(
          builder: (context) => ChangeNameScreen(initialName: initialName),
        );
}

class ChangeNameScreen extends HookWidget {
  const ChangeNameScreen({
    super.key,
    required this.initialName,
  });

  final String? initialName;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final nameEmpty = useState(true);
    final hasError = useState(false);
    final nameController = useSyncedTextEditingController(
      (value) {
        hasError.value = false;
        nameEmpty.value = value.text.isEmpty;
      },
      initialText: initialName,
    );
    final nameFocusNode = useFocusNode();

    Future<void> onSubmitted(BuildContext context) async {
      if (nameController.text.isEmpty) {
        hasError.value = true;
        return;
      }

      nameFocusNode.unfocus();
      final result = await authCubit.changeUserName(
        userName: nameController.text,
      );

      if (result) {
        Navigator.of(context).pop();
      }

      hasError.value = !result;
    }

    return Scaffold(
      appBar: const QSAppBar(),
      backgroundColor: context.colors.background,
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusManager.instance.primaryFocus?.unfocus,
          behavior: HitTestBehavior.translucent,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const ClampingScrollPhysics(),
            clipBehavior: Clip.none,
            child: Column(
              children: [
                const SizedBox(height: 40),
                QSText(
                  context.l10n.change_name_page_change_name,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 32),
                QSTextField(
                  controller: nameController,
                  focusNode: nameFocusNode,
                  hasError: hasError.value,
                  hintText: context.l10n.change_name_page_name,
                  autofillHints: const [AutofillHints.name],
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.go,
                  trailling: nameEmpty.value
                      ? null
                      : GestureDetector(
                          onTap: nameController.clear,
                          child: Icon(
                            Icons.close,
                            color: context.colors.text,
                          ),
                        ),
                  onSubmitted: (_) => onSubmitted(context),
                ),
                const SizedBox(height: 16),
                QSPrimaryButton(
                  text: context.l10n.change_name_page_save,
                  onPressed: () => onSubmitted(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
