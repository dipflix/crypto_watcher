import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparklineWidget extends StatefulWidget {
  final List<double> sparkline;
  final bool showBarArea;
  final num pricePercentage;

  const SparklineWidget({
    required this.sparkline,
    required this.showBarArea,
    required this.pricePercentage,
    Key? key,
  }) : super(key: key);

  @override
  _SparklineWidgetState createState() => _SparklineWidgetState();
}

class _SparklineWidgetState extends State<SparklineWidget> {
  late final List<FlSpot> flSpots;

  @override
  void initState() {
    flSpots = [];

    for (int i = 0; i < widget.sparkline.length; i++) {
      flSpots.add(FlSpot(i.toDouble(), widget.sparkline.elementAt(i)));
    }

    super.initState();
  }

  List<int> get showIndexes => [widget.sparkline.length - 1 - 50];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final lineCharBarData = <LineChartBarData>[
      LineChartBarData(
        spots: flSpots,
        isCurved: true,
        barWidth: 2,
        isStrokeCapRound: true,
        color: theme.primaryColor,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Palette.primary.withOpacity(0.8),
              Palette.primary.withOpacity(0),
            ],
          ),
        ),
      ),
    ];

    final tooltipsOnBar = lineCharBarData[0];

    return LineChart(
      buildLineChartData(tooltipsOnBar, lineCharBarData, theme),
      swapAnimationCurve: Curves.easeInOutCubic,
      swapAnimationDuration: Duration(milliseconds: 1000),
    );
  }

  LineChartData buildLineChartData(
    LineChartBarData tooltipsOnBar,
    List<LineChartBarData> lineCharBarData,
    ThemeData theme,
  ) {
    return LineChartData(
      showingTooltipIndicators:
          buildShowingToolTipIndicators(tooltipsOnBar, lineCharBarData),
      lineTouchData: buildLineTouchData(theme),
      gridData: buildFlGridData(),
      titlesData: buildFlTitlesData(theme),
      borderData: buildFlBorderData(),
      minX: 0,
      maxX: widget.sparkline.length.toDouble(),
      minY: widget.sparkline.reduce(min),
      maxY: widget.sparkline.reduce(max),
      lineBarsData: lineCharBarData,
    );
  }

  List<ShowingTooltipIndicators> buildShowingToolTipIndicators(
      LineChartBarData tooltipsOnBar, List<LineChartBarData> lineCharBarData) {
    return showIndexes.map(
      (index) {
        return ShowingTooltipIndicators(
          [
            LineBarSpot(
              tooltipsOnBar,
              lineCharBarData.indexOf(tooltipsOnBar),
              tooltipsOnBar.spots[index],
            ),
          ],
        );
      },
    ).toList();
  }

  FlBorderData buildFlBorderData() {
    return FlBorderData(
      show: false,
    );
  }

  FlTitlesData buildFlTitlesData(
    ThemeData theme,
  ) {
    return FlTitlesData(
      show: true,
      topTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              return TextBody(
                () {
                  switch (value.toInt()) {
                    case 0:
                      return '1${'day'.tr()}';
                    case 24:
                      return '2${'day'.tr()}';
                    case 48:
                      return '3${'day'.tr()}';
                    case 72:
                      return '4${'day'.tr()}';
                    case 96:
                      return '5${'day'.tr()}';
                    case 120:
                      return '6${'day'.tr()}';
                    case 144:
                      return '7${'day'.tr()}';
                  }
                  return '';
                }.call(),
                fontSize: 10.sp,
                color: Palette.overlay3,
              );
            }),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
          reservedSize: 40,
        ),
      ),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  FlGridData buildFlGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      drawHorizontalLine: false,
      getDrawingVerticalLine: (double value) {
        return FlLine(
          color: Palette.overlay3.withOpacity(0.25),
          strokeWidth: 1,
        );
      },
    );
  }

  LineTouchData buildLineTouchData(ThemeData theme) {
    return LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: buildLineTouchTooltipData(theme),
      enabled: true,
      getTouchedSpotIndicator:
          (LineChartBarData barData, List<int> spotIndexes) {
        return spotIndexes.map(
          (index) {
            return buildTouchedSpotIndicatorData(theme);
          },
        ).toList();
      },
    );
  }

  TouchedSpotIndicatorData buildTouchedSpotIndicatorData(ThemeData theme) {
    return TouchedSpotIndicatorData(
      FlLine(
        color: Palette.overlay1,
        strokeWidth: 1,
        dashArray: [4, 4],
      ),
      FlDotData(
        show: false,
        getDotPainter: (spot, percent, barData, index) {
          return FlDotCirclePainter(
            radius: 8,
            color: [
              Colors.black,
              Colors.black,
            ][index],
            strokeWidth: 2,
            strokeColor: Colors.black,
          );
        },
      ),
    );
  }

  LineTouchTooltipData buildLineTouchTooltipData(ThemeData theme) {
    return LineTouchTooltipData(
        tooltipBgColor: theme.backgroundColor,
        tooltipRoundedRadius: Sizes.borderSmall,
        tooltipPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4).r,
        fitInsideHorizontally: true,
        getTooltipItems: (touchedSpots) {
          return touchedSpots.map((touchedSpot) {
            return LineTooltipItem(
              '${touchedSpot.y.abs().toStringAsFixed(2)}',
              TextStyle(
                color: theme.primaryColor,
                fontSize: FontSize.body,
                fontWeight: FontWeight.w600,
              ),
            );
          }).toList();
        });
  }
}
