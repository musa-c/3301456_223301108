import 'package:http/http.dart' as http;

abstract class IBookMarkController {
  http.Response createBookMark(int userId, int postId);
  http.Response getUserBookMarkByPostId(int postId);
}
