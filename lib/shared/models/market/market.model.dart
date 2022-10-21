import 'package:freezed_annotation/freezed_annotation.dart';

part 'market.model.g.dart';

part 'market.model.freezed.dart';

@freezed
class MarketModel with _$MarketModel {
  const factory MarketModel({
    required String id,
    required String symbol,
    required String name,
    required String image,
    required double currentPrice,
    required int marketCap,
    int? marketCapRank,
    int? fullyDilutedValuation,
    double? totalVolume,
    double? high24H,
    double? low24H,
    @JsonKey(name: 'price_change_24h') double? priceChange,
    @JsonKey(name: 'price_change_percentage_24h')
        required double priceChangePercentage,
    double? marketCapChange24H,
    double? marketCapChangePercentage24H,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
    double? ath,
    double? athChangePercentage,
    DateTime? athDate,
    double? atl,
    double? atlChangePercentage,
    DateTime? atlDate,
    DateTime? lastUpdated,
    @JsonKey(name: 'sparkline_in_7d')
    // Per 7 days
    SparklineIn7dModel? sparkline,
  }) = _MarketModel;

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);
}

@freezed
class SparklineIn7dModel with _$SparklineIn7dModel {
  const factory SparklineIn7dModel({
    required Iterable<double> price,
  }) = _SparklineIn7dModel;

  factory SparklineIn7dModel.fromJson(Map<String, dynamic> json) => _$SparklineIn7dModelFromJson(json);
}
