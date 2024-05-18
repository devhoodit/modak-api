import 'package:modak/src/api/auth/auth.dart';
import 'package:modak/src/api/endpoint.dart';
import 'package:modak/src/api/request.dart';
import 'package:modak/src/api/social/social_dto.dart';
import 'package:modak/src/api/validator.dart';
import 'package:modak/src/types/uuid.dart';

class SocialAPI {
  AuthAPI auth;
  Endpoint endpoint;
  SocialAPI(this.auth, this.endpoint);

  /// get [target]'s [Followers]
  Future<Followers> getFollowers(String targetname,
      {int offset = 0, int limit = 8}) async {
    validateRange(offset, limit, 64);
    final apires = await auth.get(
        "${endpoint.baseurl}/social/follower/$targetname?offset=$offset&limit=$limit",
        responseJsonWrapper(Followers.fromJson));
    return apires.data;
  }

  /// get [target]'s [Followings]
  Future<Followings> getFollowings(String targetname,
      {int offset = 0, int limit = 8}) async {
    validateRange(offset, limit, 64);
    final apires = await auth.get(
        "${endpoint.baseurl}/social/following/$targetname?offset=$offset&limit=$limit",
        responseJsonWrapper(Followings.fromJson));
    return apires.data;
  }

  /// request [target] to follow accept
  Future<void> requestFollow(String targetname) async {
    await auth.post(
        "${endpoint.baseurl}/social/follow/$targetname", (res) => null);
  }

  /// get [FollowRequests]
  Future<FollowRequests> getFollowRequests(
      {int offset = 0, int limit = 16}) async {
    validateRange(offset, limit, 64);
    final resapi = await auth.get(
        "${endpoint.baseurl}/social/requests?offset=$offset&limit=$limit",
        responseJsonWrapper(FollowRequests.fromJson));
    return resapi.data;
  }

  /// accept [target]'s follow request
  Future<void> acceptFollowRequest(UUID code) async {
    await auth.post(
        "${endpoint.baseurl}/social/follow/accept/$code", (res) => null);
  }

  /// reject [target]'s follow request
  Future<void> rejectFollowRequest(UUID code) async {
    await auth.post(
        "${endpoint.baseurl}/social/follow/reject/$code", (res) => null);
  }

  /// query i follow [target]
  Future<bool> isFollowing(String targetname) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/social/is-following/$targetname",
        (res) => res.body as bool);
    return apires.data;
  }

  /// query [target] follow me
  Future<bool> isFollower(String targetname) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/social/is-follower/$targetname",
        (res) => res.body as bool);
    return apires.data;
  }

  /// query [target] and me [Relation]
  Future<Relation> getRelation(String targetname) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/social/relation/$targetname",
        responseJsonWrapper(Relation.fromJson));
    return apires.data;
  }

  /// remove follower [target]
  Future<void> removeFollower(String targetname) async {
    await auth.delete("${endpoint.baseurl}/social/follower/$targetname");
  }

  /// unfollow [target]
  Future<void> removeFollowing(String targetname) async {
    await auth.delete("${endpoint.baseurl}/social/following/$targetname");
  }
}
