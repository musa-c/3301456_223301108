import 'package:abc/product/constants/api_url_constants.dart';
import 'package:http/http.dart' as http;
import 'package:abc/product/api/controllers/abstract/i_bookmark_controller.dart';
import 'package:http/src/response.dart';

class BookMarkController implements IBookMarkController {
  @override
  Future<Response> createBookMark(int userId, int postId) async {
    final response = await http
        .post(Uri.parse('${ApiUrlConstants.createBookMark}/$userId/$postId'));
    return response;
  }

  @override
  Future<Response> getUserBookMarkByPostId(int postId) async {
    final response = await http
        .get(Uri.parse('${ApiUrlConstants.getUserBookMarkByPostId}/$postId'));
    return response;
  }
}
