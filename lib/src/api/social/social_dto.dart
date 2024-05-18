import 'package:json_annotation/json_annotation.dart';
import 'package:modak/modak.dart';
import 'package:modak/src/types/uuid.dart';

part 'social_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class Followers {
  final List<String> followers;
  Followers(this.followers);
  factory Followers.fromJson(Map<String, dynamic> json) =>
      _$FollowersFromJson(json);
  Map<String, dynamic> toJson() => _$FollowersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Followings {
  final List<String> followings;
  Followings(this.followings);
  factory Followings.fromJson(Map<String, dynamic> json) =>
      _$FollowingsFromJson(json);
  Map<String, dynamic> toJson() => _$FollowingsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowRequests {
  final List<FollowRequest> requests;
  FollowRequests(this.requests);
  factory FollowRequests.fromJson(Map<String, dynamic> json) =>
      _$FollowRequestsFromJson(json);
  Map<String, dynamic> toJson() => _$FollowRequestsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowRequest {
  final UUID code;
  final String username;
  FollowRequest(this.code, this.username);
  factory FollowRequest.fromJson(Map<String, dynamic> json) =>
      _$FollowRequestFromJson(json);
  Map<String, dynamic> toJson() => _$FollowRequestToJson(this);
}

@JsonSerializable()
class Relation {
  @JsonKey(name: "is_following")
  final bool isFollowing;
  @JsonKey(name: "is_follower")
  final bool isFollower;
  Relation(this.isFollowing, this.isFollower);
  factory Relation.fromJson(Map<String, dynamic> json) =>
      _$RelationFromJson(json);
  Map<String, dynamic> toJson() => _$RelationToJson(this);
}
