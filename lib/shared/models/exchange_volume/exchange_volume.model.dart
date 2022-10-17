import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:crypto_watcher/shared/models/model.dart';

part 'exchange_volume.model.g.dart';
part 'exchange_volume.model.freezed.dart';

@freezed
class ExchangeVolumeModel with _$ExchangeVolumeModel {
  const factory ExchangeVolumeModel({
    required String name,
    String? yearEstablished,
    String? country,
    required String description,
    required String url,
    required String image,
    required String facebookUrl,
    required String redditUrl,
    required String telegramUrl,
    required String slackUrl,
    required String otherUrl1,
    required String otherUrl2,
    required String twitterHandle,
    required bool hasTradingIncentive,
    required bool centralized,
    required String publicNotice,
    required String alertNotice,
    String? trustScore,
    required int trustScoreRank,
    required double tradeVolume24HBtc,
    required double tradeVolume24HBtcNormalized,
    required List<TickerModel> tickers,
    List<String>? statusUpdates,
  }) = _ExchangeVolumeModel;

  factory ExchangeVolumeModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeVolumeModelFromJson(json);
}
