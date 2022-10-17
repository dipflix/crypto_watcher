import 'package:freezed_annotation/freezed_annotation.dart';

part 'developer_data.model.g.dart';

part 'developer_data.model.freezed.dart';

@freezed
class DeveloperDataModel with _$DeveloperDataModel {
  const factory DeveloperDataModel({
    required int forks,
    required int stars,
    required int subscribers,
    required int totalIssues,
    required int closedIssues,
    required int pullRequestsMerged,
    required int pullRequestContributors,
    required int commitCount4Weeks,
  }) = _DeveloperDataModel;

  factory DeveloperDataModel.fromJson(Map<String, dynamic> json) =>
      _$DeveloperDataModelFromJson(json);
}
