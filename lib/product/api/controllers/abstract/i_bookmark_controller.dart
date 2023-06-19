import 'package:http/http.dart';

abstract class IBookMarkController {
  Future<Response> createBookMark(int userId, int postId);
  Future<Response> getUserBookMarkByPostId(int postId);
}
