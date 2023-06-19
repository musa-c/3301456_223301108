import 'package:abc/product/constants/api_url_constants.dart';
import 'package:abc/product/api/controllers/abstract/i_dislike_controller.dart';
import 'package:http/src/response.dart';
import 'package:http/http.dart' as http;

class DislikesController implements IDislikeController {
  @override
  Future<Response> createDislike(int userId, int postId) async {
    final response = await http
        .post(Uri.parse('${ApiUrlConstants.createDislikeUrl}/$userId/$postId'));
    return response;
  }

  @override
  Future<Response> getUserDislikesByPostId(int postId) async {
    final response = await http
        .get(Uri.parse('${ApiUrlConstants.getUserDislikesByPostId}/$postId'));
    return response;
  }
}
