import 'package:http/http.dart' as http;

abstract class IDislikeController {
  http.Response createDislike(int userId, int postId);
  http.Response getUserDislikesByPostId(int postId);
}
