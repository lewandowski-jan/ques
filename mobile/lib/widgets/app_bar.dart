import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/widgets/widgets.dart';

class QSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const QSAppBar({
    super.key,
    this.title = '',
  });

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: QSText(
                title,
                style: context.textTheme.titleSmall,
              ),
            ),
          ),
          if (canPop)
            OnPressedAnimatedScale(
              child: Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colors.primary,
                ),
                child: IconButton(
                  onPressed: Navigator.of(context).pop,
                  color: context.colors.secondary,
                  icon: Icon(
                    Icons.chevron_left,
                    color: context.colors.background,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
