import 'package:http/http.dart';

import '../../../models/post_model.dart';

abstract class IUserController {
  Future<List<User>> getAll();
  Future<Response> emailorPasswordCheck(String email, String password);
  Future<Response> usernameOrPasswordCheck(String username, String password);
  Future<Response> createUser(String username, String email, String password);
  Future<User> getUserById(int id);
  Future<Response> updateAvatar(int userId, String avatar);
}
