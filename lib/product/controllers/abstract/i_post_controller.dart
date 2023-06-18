import 'package:http/http.dart';

import '../../models/post_model.dart';

abstract class IPostController {
  Future<List<Post>> getAll();
  Future<Response> createPost(int userId, String text);
  Future<List<Post>> getPostByUserId(int userId);
  Future<Response> deletePost(int postId);
  Future<Response> updatePost(int postId, String updateText);
}
