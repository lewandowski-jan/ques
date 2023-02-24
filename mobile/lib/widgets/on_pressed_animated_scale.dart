import 'package:flutter/material.dart';
import 'package:leancode_hooks/leancode_hooks.dart';

class OnPressedAnimatedScale extends HookWidget {
  const OnPressedAnimatedScale({
    super.key,
    required this.child,
  });

  final Widget child;

  static const _animationDuration = Duration(milliseconds: 50);
  static const _animationCurve = Curves.easeOut;

  void animateIn(AnimationController controller) => controller.forward();

  void animateOut(AnimationController controller) => controller.reverse();

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: _animationDuration,
    );
    final animation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(
        parent: controller,
        curve: _animationCurve,
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (_) => animateIn(controller),
      onTapUp: (_) => animateOut(controller),
      onPanDown: (_) => animateIn(controller),
      onPanEnd: (_) => animateOut(controller),
      onPanCancel: () => animateOut(controller),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Transform.scale(
            scale: animation.value,
            child: child,
          );
        },
      ),
    );
  }
}
