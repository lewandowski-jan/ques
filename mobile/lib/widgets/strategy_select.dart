import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ques/resources/resources.dart';
import 'package:ques/utils/spaced.dart';

class QSStrategySelect extends StatelessWidget {
  const QSStrategySelect({
    super.key,
    required this.selectedIndex,
    required this.onIndexChanged,
    required this.children,
  }) : assert(
          children.length == 3,
        );

  final int selectedIndex;
  final ValueChanged<int> onIndexChanged;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        final optionWidth = (maxWidth - 2 * 20) / 3;

        return Row(
          children: children
              .mapIndexed(
                (index, child) => _StrategyOption(
                  width: optionWidth,
                  selected: index == selectedIndex,
                  onTap: () {
                    if (index != selectedIndex) {
                      onIndexChanged(index);
                    }
                  },
                  child: child,
                ),
              )
              .spaced(20)
              .toList(),
        );
      },
    );
  }
}

class _StrategyOption extends StatelessWidget {
  const _StrategyOption({
    required this.width,
    required this.selected,
    required this.onTap,
    required this.child,
  });

  final double width;
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: context.colors.secondaryLight,
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child,
            _StrategyOptionRadio(enabled: selected),
          ],
        ),
      ),
    );
  }
}

class _StrategyOptionRadio extends StatelessWidget {
  const _StrategyOptionRadio({required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.background,
      ),
      child: Center(
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: enabled ? context.colors.primary : context.colors.background,
          ),
        ),
      ),
    );
  }
}
