import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_platforms.model.g.dart';
part 'asset_platforms.model.freezed.dart';


@freezed
class AssetPlatformsModel with _$AssetPlatformsModel {
  const factory AssetPlatformsModel({
    required String id,
    required int chainIdentifier,
    required String name,
    required String shortname,
  }) = _AssetPlatformsModel;

  factory AssetPlatformsModel.fromJson(Map<String, dynamic> json) =>
      _$AssetPlatformsModelFromJson(json);
}
