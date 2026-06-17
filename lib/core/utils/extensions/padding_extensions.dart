import 'package:flutter/material.dart';

extension CustomDoubleExtensions on num {
  EdgeInsets get padHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  EdgeInsets get padVertical => EdgeInsets.symmetric(vertical: toDouble());

  EdgeInsets get padAll => EdgeInsets.all(toDouble());

  EdgeInsets get padTop => EdgeInsets.only(top: toDouble());

  EdgeInsets get padBottom => EdgeInsets.only(bottom: toDouble());

  EdgeInsets get padLeft => EdgeInsets.only(left: toDouble());

  EdgeInsets get padRight => EdgeInsets.only(right: toDouble());

  Widget get sizedHeight => SizedBox(height: toDouble());

  Widget get sizedWidth => SizedBox(width: toDouble());
  EdgeInsetsGeometry get padStart =>
      EdgeInsetsDirectional.only(start: toDouble());

  EdgeInsetsGeometry get padEnd => EdgeInsetsDirectional.only(end: toDouble());
}

extension EdgeInsetsGeometryX on EdgeInsetsGeometry {
  EdgeInsetsGeometry operator +(EdgeInsetsGeometry other) {
    return this.add(other);
  }
}
extension PaddingList on List<Widget> {
  List<Widget> paddingDirectional({
    double top = 0,
    double bottom = 0,
    double start = 0,
    double end = 0,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.only(
          top: top,
          bottom: bottom,
          start: start,
          end: end,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingSymmetric({
    double vertical = 0,
    double horizontal = 0,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingAll(double padding) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.all(padding),
        child: e,
      ),
    ).toList();
  }
}
