import 'package:flutter/material.dart';

Widget buildColumnList({
  required int length,
  required Widget Function(int index) buildWidget,
  required Widget Function() buildSpace,
  CrossAxisAlignment? crossAxisAlignment,
  MainAxisAlignment? mainAxisAlignment,
}) {
  if (length > 0) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        ...List.generate(length * 2 - 1, (index) {
          if (index.isEven) {
            return buildWidget.call(index ~/ 2);
          } else {
            return buildSpace.call();
          }
        }),
      ],
    );
  }

  return const SizedBox.shrink();
}

Widget buildRowList({
  required int length,
  required Widget Function(int index) buildWidget,
  required Widget Function() buildSpace,
  EdgeInsets padding = EdgeInsets.zero,
}) {
  if (length > 0) {
    return Padding(
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(length * 2 - 1, (index) {
            if (index.isEven) {
              return buildWidget.call(index ~/ 2);
            } else {
              return buildSpace.call();
            }
          }),
        ],
      ),
    );
  }

  return const SizedBox.shrink();
}
