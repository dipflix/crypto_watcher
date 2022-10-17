import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_data.model.g.dart';
part 'global_data.model.freezed.dart';

@freezed
class GlobalModel with _$GlobalModel {
  const factory GlobalModel({
    required int activeCryptocurrencies,
    required int upcomingIcos,
    required int ongoingIcos,
    required int endedIcos,
    required int markets,
    required Map<String, double> totalMarketCap,
    required Map<String, double> totalVolume,
    required Map<String, double> marketCapPercentage,
    required double marketCapChangePercentage24HUsd,
    required int updatedAt,
  }) = _GlobalModel;
  
  factory GlobalModel.fromJson(Map<String, dynamic> json) => _$GlobalModelFromJson(json);
}
