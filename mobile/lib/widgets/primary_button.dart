import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class QSPrimaryButton extends StatelessWidget {
  const QSPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OnPressedAnimatedScale(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: context.colors.secondaryLight,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: QSText(
              text,
              style: context.textTheme.titleMedium,
              color: context.colors.primary,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
