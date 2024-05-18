// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Followers _$FollowersFromJson(Map<String, dynamic> json) => Followers(
      (json['followers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FollowersToJson(Followers instance) => <String, dynamic>{
      'followers': instance.followers,
    };

Followings _$FollowingsFromJson(Map<String, dynamic> json) => Followings(
      (json['followings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FollowingsToJson(Followings instance) =>
    <String, dynamic>{
      'followings': instance.followings,
    };

FollowRequests _$FollowRequestsFromJson(Map<String, dynamic> json) =>
    FollowRequests(
      (json['requests'] as List<dynamic>)
          .map((e) => UUID.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$FollowRequestsToJson(FollowRequests instance) =>
    <String, dynamic>{
      'requests': instance.requests.map((e) => e.toJson()).toList(),
    };

FollowRequest _$FollowRequestFromJson(Map<String, dynamic> json) =>
    FollowRequest(
      UUID.fromJson(json['code'] as String),
      json['username'] as String,
    );

Map<String, dynamic> _$FollowRequestToJson(FollowRequest instance) =>
    <String, dynamic>{
      'code': instance.code.toJson(),
      'username': instance.username,
    };

Relation _$RelationFromJson(Map<String, dynamic> json) => Relation(
      json['is_following'] as bool,
      json['is_follower'] as bool,
    );

Map<String, dynamic> _$RelationToJson(Relation instance) => <String, dynamic>{
      'is_following': instance.isFollowing,
      'is_follower': instance.isFollower,
    };
