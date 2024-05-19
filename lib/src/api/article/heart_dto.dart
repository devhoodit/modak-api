import 'package:json_annotation/json_annotation.dart';

part 'heart_dto.g.dart';

@JsonSerializable()
class HeartState {
  @JsonKey(name: "heart")
  final bool state;
  HeartState(this.state);
  factory HeartState.fromJson(Map<String, dynamic> json) =>
      _$HeartStateFromJson(json);
  Map<String, dynamic> toJson() => _$HeartStateToJson(this);
}

@JsonSerializable()
class HeartCount {
  @JsonKey(name: "counts")
  final int count;
  HeartCount(this.count);
  factory HeartCount.fromJson(Map<String, dynamic> json) =>
      _$HeartCountFromJson(json);
  Map<String, dynamic> toJson() => _$HeartCountToJson(this);
}
