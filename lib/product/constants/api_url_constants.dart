import 'package:flutter/material.dart';

@immutable
class ApiUrlConstants {
  const ApiUrlConstants._();
  static const String remoteUrl = "https://192.168.1.6:45455/";

  static const String getAllUserUrl = "${remoteUrl}api/users";
  static const String getUserByIdUrl = "${remoteUrl}api/users/GetUserById";
  static const String createUserUrl = "$getAllUserUrl/createUser";
  static const String emailorPasswordCheckUrl =
      "$getAllUserUrl/emailorPasswordCheck";
  static const String usernameOrPasswordCheck =
      "$getAllUserUrl/usernameOrPasswordCheck";
  static const String updateAvatarUrl = "$getAllUserUrl/UpdateAvatar";

  static const String getAllPostUrl = "${remoteUrl}api/posts";
  static const String createPostUrl = "$getAllPostUrl/CreatePost";
  static const String getPostByUserIdUrl = "$getAllPostUrl/GetPostByUserId";
  static const String updatePostUrl = "$getAllPostUrl/updatePost";
  static const String deletePostUrl = "$getAllPostUrl/delete";

  static const String createLikeUrl = "${remoteUrl}api/likes/CreateLike";
  static const String getUserLikesByPostIdUrl =
      "${remoteUrl}api/likes/getUserLikesByPostId";

  static const String createDislikeUrl =
      "${remoteUrl}api/dislikes/CreateDislike";
  static const String getUserDislikesByPostId =
      "${remoteUrl}api/dislikes/GetUserDislikesByPostId";

  static const String createBookMark =
      "${remoteUrl}api/bookmarkers/CreateBookMark";
  static const String getUserBookMarkByPostId =
      "${remoteUrl}api/bookmarkers/GetUserBookMarkByPostId";
}
