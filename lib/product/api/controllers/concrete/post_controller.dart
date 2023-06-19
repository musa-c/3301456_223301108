import 'dart:convert';

import 'package:abc/product/constants/api_url_constants.dart';
import 'package:abc/product/api/controllers/abstract/i_post_controller.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;
import '../../../models/post_model.dart';

class PostController implements IPostController {
  @override
  Future<Response> createPost(int userId, String text) async {
    final response = await http.post(
        Uri.parse('${ApiUrlConstants.createPostUrl}/$userId'),
        body: jsonEncode({'text': text}),
        headers: {'Content-Type': 'application/json'});
    return response;
  }

  @override
  Future<Response> deletePost(int postId) async {
    final response = await http
        .delete(Uri.parse('${ApiUrlConstants.deletePostUrl}/$postId'));
    return response;
  }

  @override
  Future<List<Post>> getAll() async {
    final response = await http.get(Uri.parse(ApiUrlConstants.getAllPostUrl));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Post> postList =
          jsonResponse.map((item) => Post.fromJson(item)).toList();
      return postList;
    } else {
      throw Exception("a");
    }
  }

  @override
  Future<List<Post>> getPostByUserId(int userId) async {
    final response = await http
        .get(Uri.parse('${ApiUrlConstants.getPostByUserIdUrl}/$userId'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Post> postList =
          jsonResponse.map((item) => Post.fromJson(item)).toList();
      return postList;
    } else {
      throw Exception("a");
    }
  }

  @override
  Future<Response> updatePost(int postId, String updateText) async {
    final response =
        await http.put(Uri.parse('${ApiUrlConstants.updatePostUrl}/$postId'),
            headers: <String, String>{
              'Content-Type': 'application/json;charset=UTF-8',
            },
            body: jsonEncode(updateText));
    return response;
  }
}
