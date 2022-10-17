import 'package:crypto_watcher/shared/models/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticker.model.g.dart';

part 'ticker.model.freezed.dart';

@freezed
class TickerModel with _$TickerModel {
  const factory TickerModel({
    required String base,
    required String target,
    required MarketModel market,
    required double last,
    required double volume,
    required Map<String, double> convertedLast,
    required Map<String, double> convertedVolume,
    required String trustScore,
    required double bidAskSpreadPercentage,
    required DateTime timestamp,
    required DateTime lastTradedAt,
    required DateTime lastFetchAt,
    required bool isAnomaly,
    required bool isStale,
    required String tradeUrl,
    String? tokenInfoUrl,
    required String coinId,
    required String targetCoinId,
  }) = _TickerModel;

  factory TickerModel.fromJson(Map<String, dynamic> json) =>
      _$TickerModelFromJson(json);
}
