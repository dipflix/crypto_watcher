import 'package:crypto_watcher/shared/models/repository_url/repository_url.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'links.model.g.dart';

part 'links.model.freezed.dart';

@freezed
abstract class LinksModel with _$LinksModel {
  const factory LinksModel({
    required List<String> homepage,
    required List<String> blockchainSite,
    required List<String> officialForumUrl,
    required List<String> chatUrl,
    required List<String> announcementUrl,
    required String twitterScreenName,
    required String facebookUsername,
    required int bitcointalkThreadIdentifier,
    required String telegramChannelIdentifier,
    required String subredditUrl,
    required RepositoryUrlModel reposUrl,
  }) = _LinksModel;

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);
}
