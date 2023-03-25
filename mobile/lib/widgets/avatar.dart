import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/on_pressed_animated_scale.dart';

class QSAvatar extends StatelessWidget {
  const QSAvatar({
    super.key,
    required this.size,
    this.onTap,
  });

  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: runtimeType,
      child: OnPressedAnimatedScale(
        enabled: onTap != null,
        child: GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            radius: size / 2,
            backgroundColor: context.colors.primary,
            child: Icon(
              Icons.person_outline,
              color: context.colors.background,
              size: size / 2,
            ),
          ),
        ),
      ),
    );
  }
}
