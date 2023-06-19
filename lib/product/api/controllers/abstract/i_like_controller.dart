import 'package:http/http.dart';

import '../../../models/post_model.dart';

abstract class ILikeController {
  Future<Response> createLike(int userId, int postId);
  Future<List<Post>> getUserLikesByPostId(int postId);
}
