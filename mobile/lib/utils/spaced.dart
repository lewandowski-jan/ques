import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

extension SpacedWidgets on Iterable<Widget> {
  /// Interleaves this list of widgets with [spacer].
  List<Widget> spacedWith(Widget spacer) => expand((item) sync* {
        yield spacer;
        yield item;
      }).skip(1).toList();

  /// Creates gaps between given widgets
  ///
  /// Useful for [Column]s/[Row]s which does not take a fixed size gap as
  /// parameter.
  ///
  /// Example:
  /// ```dart
  /// [Widget1(), Widget2(), Widget3()].spaced(8)
  /// // the above is equivalent to
  /// [
  ///   Widget1(),
  ///   SizedBox(width: 8, height: 8),
  ///   Widget2(),
  ///   SizedBox(width: 8, height: 8),
  ///   Widget3(),
  /// ]
  /// ```
  List<Widget> spaced(double gap) =>
      spacedWith(SizedBox(width: gap, height: gap));

  /// Wraps every widget in this list of widgets with [padding].
  List<Widget> padded(
    EdgeInsets padding, {
    bool alsoFirst = true,
    bool alsoLast = true,
  }) {
    return mapIndexed((index, widget) {
      if (index == 0 && !alsoFirst) {
        return widget;
      }

      if (index == length - 1 && !alsoLast) {
        return widget;
      }

      return Padding(padding: padding, child: widget);
    }).toList();
  }
}
