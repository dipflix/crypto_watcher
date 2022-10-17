import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange.model.g.dart';

part 'exchange.model.freezed.dart';

@freezed
class ExchangeModel with _$ExchangeModel {
  const factory ExchangeModel({
    required String id,
    required String name,
    required int yearEstablished,
    required String country,
    required String description,
    required String url,
    required String image,
    required bool hasTradingIncentive,
    required int trustScore,
    required int trustScoreRank,
    required double tradeVolume24HBtc,
    required double tradeVolume24HBtcNormalized,
  }) = _ExchangeModel;

  factory ExchangeModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeModelFromJson(json);
}
