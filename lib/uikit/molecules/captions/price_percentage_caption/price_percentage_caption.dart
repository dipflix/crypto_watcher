import 'package:crypto_watcher/uikit/atoms/atoms.dart';
import 'package:crypto_watcher/uikit/styles/fonts_size.dart';
import 'package:crypto_watcher/uikit/styles/palette.dart';
import 'package:flutter/material.dart';

class PricePercentageCaption extends StatelessWidget {
  final double percentage;

  const PricePercentageCaption({Key? key, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isPositive = percentage > 0;
    var color = isPositive ? Palette.success : Palette.errorRed;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        child: TextBody.semiBold(
          '${isPositive ? '+' : '-'}${percentage.abs().toStringAsFixed(2)}%',
          color: color,
          fontSize: FontSize.smallCaption,
        ),
      ),
    );
  }
}
