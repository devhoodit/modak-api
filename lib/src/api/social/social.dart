import 'package:modak/src/api/auth/auth.dart';
import 'package:modak/src/api/endpoint.dart';
import 'package:modak/src/api/request.dart';
import 'package:modak/src/api/social/social_dto.dart';

class SocialAPI {
  AuthAPI auth;
  Endpoint endpoint;
  SocialAPI(this.auth, this.endpoint);

  Future<Followers> getFollowers(String target) async {
    final apires = await auth.get("${endpoint.baseurl}/social/follower/$target",
        responseJsonWrapper(Followers.fromJson));
    return apires.data;
  }

  Future<Followings> getFollowings(String target) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/social/following/$target",
        responseJsonWrapper(Followings.fromJson));
    return apires.data;
  }

  Future<void> requestFollow(String target) async {
    await auth.post("${endpoint.baseurl}/social/follow/$target", (res) => null);
  }

  Future<FollowRequests> getFollowRequests() async {
    final resapi = await auth.get("${endpoint.baseurl}/social/requests",
        responseJsonWrapper(FollowRequests.fromJson));
    return resapi.data;
  }

  Future<void> acceptFollowRequest(String target) async {
    await auth.post(
        "${endpoint.baseurl}/social/follow/accept/$target", (res) => null);
  }

  Future<void> rejectFollowRequest(String target) async {
    await auth.post(
        "${endpoint.baseurl}/social/follow/reject/$target", (res) => null);
  }

  Future<bool> isFollowing(String target) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/social/is-following/$target",
        (res) => res.body as bool);
    return apires.data;
  }

  Future<bool> isFollower(String target) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/social/is-follower/$target",
        (res) => res.body as bool);
    return apires.data;
  }

  Future<Relation> getRelation(String target) async {
    final apires = await auth.get("${endpoint.baseurl}/social/relation/$target",
        responseJsonWrapper(Relation.fromJson));
    return apires.data;
  }

  Future<void> removeFollower(String target) async {
    await auth.delete("${endpoint.baseurl}/social/follower/$target");
  }

  Future<void> removeFollowing(String target) async {
    await auth.delete("${endpoint.baseurl}/social/following/$target");
  }
}
