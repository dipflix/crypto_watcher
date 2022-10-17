import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.model.g.dart';

part 'image.model.freezed.dart';

@freezed
abstract class ImageModel with _$ImageModel {
  const factory ImageModel({
    required String thumb,
    required String small,
    required String large,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
