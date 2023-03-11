import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';

class LoadingPage extends MaterialPage<void> {
  const LoadingPage() : super(child: const QSLoading(transparent: false));
}

class QSLoading extends StatelessWidget {
  const QSLoading({
    super.key,
    required this.transparent,
  });

  final bool transparent;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          transparent ? context.colors.transparent : context.colors.background,
      child: Center(
        child: Assets.animation.pointMap.lottie(
          animate: true,
          repeat: true,
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
