import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin.model.g.dart';

part 'coin.model.freezed.dart';

@freezed
class CoinModel with _$CoinModel {
  const factory CoinModel({
    required String id,
    required String symbol,
    required String name,
    Map<String, String>? platforms,
  }) = _CoinModel;

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}
