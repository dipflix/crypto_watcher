import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_url.model.g.dart';

part 'repository_url.model.freezed.dart';

@freezed
class RepositoryUrlModel with _$RepositoryUrlModel {
  const factory RepositoryUrlModel({
    List<String>? github,
    List<String>? bitbucket,
  }) = _RepositoryUrlModel;

  factory RepositoryUrlModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryUrlModelFromJson(json);
}
