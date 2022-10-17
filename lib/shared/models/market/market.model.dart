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
    int? marketCap,
    int? marketCapRank,
    int? fullyDilutedValuation,
    double? totalVolume,
    double? high24H,
    double? low24H,
    double? priceChange24H,
    double? priceChangePercentage24H,
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
  }) = _MarketModel;

  factory MarketModel.fromJson(Map<String, dynamic> json) =>
      _$MarketModelFromJson(json);
}
