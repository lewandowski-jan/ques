import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class ChangePasswordRoute extends MaterialPageRoute<void> {
  ChangePasswordRoute()
      : super(
          builder: (context) => const ChangePasswordScreen(),
        );
}

class ChangePasswordScreen extends HookWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final hasError = useState(false);
    final passwordController = useSyncedTextEditingController(
      (value) {
        hasError.value = false;
      },
    );
    final passwordFocusNode = useFocusNode();

    final confirmPasswordController = useSyncedTextEditingController(
      (value) {
        hasError.value = false;
      },
    );
    final confirmPasswordFocusNode = useFocusNode();

    Future<void> onSubmitted(BuildContext context) async {
      if (passwordController.text.isEmpty ||
          confirmPasswordController.text.isEmpty) {
        hasError.value = true;
        return;
      }

      passwordFocusNode.unfocus();
      confirmPasswordFocusNode.unfocus();

      final result = await authCubit.changePassword(
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
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
                  context.l10n.change_password_page_change_password,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 32),
                QSTextField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  hasError: hasError.value,
                  hintText: context.l10n.change_password_page_password,
                  autofillHints: const [AutofillHints.newPassword],
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                QSTextField(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  hasError: hasError.value,
                  hintText: context.l10n.change_password_page_confirm_password,
                  autofillHints: const [AutofillHints.newPassword],
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.go,
                  obscureText: true,
                  onSubmitted: (_) => onSubmitted(context),
                ),
                const SizedBox(height: 16),
                QSPrimaryButton(
                  text: context.l10n.change_password_page_save,
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
