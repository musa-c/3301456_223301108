import 'package:http/http.dart';

abstract class IDislikeController {
  Future<Response> createDislike(int userId, int postId);
  Future<Response> getUserDislikesByPostId(int postId);
}
