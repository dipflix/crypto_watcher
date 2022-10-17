import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:crypto_watcher/shared/models/model.dart';

part 'community_data.model.g.dart';
part 'community_data.model.freezed.dart';


@freezed
class CoinFullModel with _$CoinFullModel {
  const factory CoinFullModel({
    required String id,
    required String symbol,
    required String name,
    required int blockTimeInMinutes,
    required String hashingAlgorithm,
    required List<String> categories,
    int? publicNotice,
    required LinksModel links,
    required ImageModel image,
    required String countryOrigin,
    required int coingeckoRank,
    required double coingeckoScore,
    required double developerScore,
    required double communityScore,
    required int liquidityScore,
    required int publicInterestScore,
    required DeveloperDataModel developerData,
    required DateTime lastUpdated,
    required List<TickerModel> tickers,
  }) = _CoinFullModel;

  factory CoinFullModel.fromJson(Map<String, dynamic> json) =>
      _$CoinFullModelFromJson(json);
}
