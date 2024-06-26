import 'package:json_annotation/json_annotation.dart';

part 'report_dto.g.dart';

@JsonSerializable()
class ReportUser {
  @JsonKey(name: "report_detail_type")
  final int type;
  final String targetname;
  final String description;
  ReportUser(this.type, this.targetname, this.description);
  factory ReportUser.fromJson(Map<String, dynamic> json) =>
      _$ReportUserFromJson(json);
  Map<String, dynamic> toJson() => _$ReportUserToJson(this);
}

typedef ReportArticle = ReportUser;

@JsonSerializable()
class ReportBug {
  final String title;
  final String description;
  ReportBug(this.title, this.description);
  factory ReportBug.fromJson(Map<String, dynamic> json) =>
      _$ReportBugFromJson(json);
  Map<String, dynamic> toJson() => _$ReportBugToJson(this);
}

typedef ReportHelp = ReportBug;
typedef ReportEtc = ReportBug;
