import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:provider/provider.dart';
import 'package:ques/features/auth/auth_cubit.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class CreateAccountRoute extends MaterialPageRoute<void> {
  CreateAccountRoute()
      : super(
          builder: (context) => const CreateAccountScreen(),
        );
}

class CreateAccountScreen extends HookWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final emailEmpty = useState(true);
    final hasError = useState(false);
    final emailController = useSyncedTextEditingController(
      (value) {
        hasError.value = false;
        emailEmpty.value = value.text.isEmpty;
      },
    );
    final emailFocusNode = useFocusNode();
    final obscureText = useState(true);
    final passwordController = useSyncedTextEditingController((value) {
      hasError.value = false;
    });
    final passwordFocusNode = useFocusNode();

    Future<void> onSubmitted() async {
      emailFocusNode.unfocus();
      passwordFocusNode.unfocus();
      final result = await authCubit.signUp(
        email: emailController.text,
        password: passwordController.text,
      );
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
                  context.l10n.create_account_page_create_account_headline,
                  style: context.textTheme.titleLarge,
                ),
                const SizedBox(height: 32),
                QSTextField(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  hasError: hasError.value,
                  hintText: context.l10n.sign_in_page_email,
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  trailling: emailEmpty.value
                      ? null
                      : GestureDetector(
                          onTap: emailController.clear,
                          child: Icon(
                            Icons.close,
                            color: context.colors.text,
                          ),
                        ),
                ),
                const SizedBox(height: 16),
                QSTextField(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: obscureText.value,
                  hasError: hasError.value,
                  hintText: context.l10n.sign_in_page_password,
                  autofillHints: const [AutofillHints.newPassword],
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.go,
                  trailling: GestureDetector(
                    onTap: () => obscureText.value = !obscureText.value,
                    child: Icon(
                      obscureText.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: context.colors.text,
                    ),
                  ),
                  onSubmitted: (_) async => onSubmitted(),
                ),
                const SizedBox(height: 16),
                QSPrimaryButton(
                  text: context.l10n.create_account_page_create_button,
                  onPressed: onSubmitted,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
