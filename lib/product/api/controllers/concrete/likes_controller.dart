import 'dart:convert';

import 'package:abc/product/constants/api_url_constants.dart';
import 'package:abc/product/api/controllers/abstract/i_like_controller.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;
import '../../../models/post_model.dart';

class LikeController implements ILikeController {
  @override
  Future<Response> createLike(int userId, int postId) async {
    final response = await http
        .post(Uri.parse('${ApiUrlConstants.createLikeUrl}/$userId/$postId'));
    return response;
  }

  @override
  Future<List<Post>> getUserLikesByPostId(int postId) async {
    final response = await http
        .get(Uri.parse('${ApiUrlConstants.getUserLikesByPostIdUrl}/$postId'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Post> postList =
          jsonResponse.map((item) => Post.fromJson(item)).toList();
      return postList;
    } else {
      throw Exception("a");
    }
  }
}
