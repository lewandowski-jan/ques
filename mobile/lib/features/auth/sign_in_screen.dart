import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:leancode_hooks/leancode_hooks.dart';
import 'package:ques/features/auth/auth_notifier.dart';
import 'package:ques/l10n/l10n.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final emailEmpty = useState(true);
    final hasError = useState(false);
    final emailController = useSyncedTextEditingController(
      (value) {
        hasError.value = false;
        emailEmpty.value = value.text.isEmpty;
      },
    );
    final obscureText = useState(true);
    final passwordController = useSyncedTextEditingController((value) {
      hasError.value = false;
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: context.colors.background,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                QSText(
                  context.l10n.app_title,
                  style: context.textTheme.headline2,
                  color: context.colors.primary,
                ),
                const SizedBox(height: 24),
                Assets.animation.mapLoupe.lottie(
                  animate: true,
                  repeat: true,
                  width: 300,
                  height: 150,
                ),
                QSText(
                  context.l10n.sing_in_page_sign_in_headline,
                  style: context.textTheme.headline6,
                ),
                const SizedBox(height: 28),
                QSTextField(
                  controller: emailController,
                  hasError: hasError.value,
                  labelText: context.l10n.sign_in_page_email,
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
                  obscureText: obscureText.value,
                  hasError: hasError.value,
                  labelText: context.l10n.sign_in_page_password,
                  autofillHints: const [AutofillHints.password],
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
                ),
                const SizedBox(height: 32),
                QSTextButton(
                  text: context.l10n.sign_in_page_sign_in_button,
                  onPressed: () async {
                    final result = await authNotifier.signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    hasError.value = !result;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
