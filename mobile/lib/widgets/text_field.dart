import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class QSTextField extends StatelessWidget {
  const QSTextField({
    super.key,
    required this.controller,
    this.hasError = false,
    this.obscureText = false,
    this.labelText,
    this.trailling,
    this.autofillHints,
    this.keyboardType,
    this.textInputAction,
  });

  final TextEditingController controller;
  final bool obscureText;
  final String? labelText;
  final bool hasError;
  final Widget? trailling;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autocorrect: false,
      autofocus: true,
      obscureText: obscureText,
      obscuringCharacter: '●',
      cursorColor: context.colors.textDark,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: context.textTheme.subtitle1,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.subtitle1!.copyWith(
          color: context.colors.textLight,
        ),
        errorText: hasError ? '' : null,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorStyle: const TextStyle(height: 0),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 12,
        ),
        errorBorder: QSInputBorder(
          borderSide: BorderSide(
            color: context.colors.accent,
            width: 2,
          ),
          dividerOpacity: trailling == null ? 0 : 1,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: QSInputBorder(
          borderSide: BorderSide(
            color: context.colors.accent,
            width: 2,
          ),
          dividerOpacity: trailling == null ? 0 : 1,
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: QSInputBorder(
          borderSide: BorderSide(
            color: context.colors.primary,
          ),
          dividerOpacity: trailling == null ? 0 : 1,
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: QSInputBorder(
          borderSide: BorderSide(
            color: context.colors.primary,
          ),
          dividerOpacity: trailling == null ? 0 : 1,
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: trailling,
      ),
    );
  }
}