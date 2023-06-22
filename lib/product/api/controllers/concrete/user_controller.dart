import 'dart:convert';

import 'package:abc/product/constants/api_url_constants.dart';
import 'package:http/src/response.dart';

import '../../../models/post_model.dart';
import 'package:http/http.dart' as http;

import '../abstract/i_user_controller.dart';

class UserController implements IUserController {
  @override
  Future<Response> createUser(
      String username, String email, String password) async {
    final response = await http.post(
      Uri.parse(ApiUrlConstants.createUserUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'UserName': username,
        'Email': email,
        'Password': password,
      }),
    );
    return response;
  }

  @override
  Future<Response> emailorPasswordCheck(String email, String password) async {
    final response = await http.get(Uri.parse(
        '${ApiUrlConstants.emailorPasswordCheckUrl}/$email/$password'));
    return response;
  }

  @override
  Future<List<User>> getAll() async {
    final response = await http.get(Uri.parse(ApiUrlConstants.getAllUserUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<User> userList =
          jsonResponse.map((item) => User.fromJson(item)).toList();
      return userList;
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<Response> usernameOrPasswordCheck(
      String username, String password) async {
    final response = await http.get(Uri.parse(
        '${ApiUrlConstants.usernameOrPasswordCheck}/$username/$password'));
    return response;
  }

  @override
  Future<User> getUserById(int id) async {
    final response =
        await http.get(Uri.parse('${ApiUrlConstants.getUserByIdUrl}/$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      User user = User.fromJson(jsonResponse);
      return user;
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load users');
    }
  }

  @override
  Future<Response> updateAvatar(int userId, String avatar) async {
    final response = await http
        .put(Uri.parse('${ApiUrlConstants.updateAvatarUrl}/$userId/$avatar'));
    return response;
  }

  @override
  Future<Response> updateEmail(int userId, String email) async {
    final response = await http
        .put(Uri.parse('${ApiUrlConstants.updateEmailUrl}/$userId/$email'));
    return response;
  }

  @override
  Future<Response> updateFirstName(int userId, String firtname) async {
    final response = await http.put(
        Uri.parse('${ApiUrlConstants.updateFirstNameUrl}/$userId/$firtname'));
    return response;
  }

  @override
  Future<Response> updateLastName(int userId, String lastname) async {
    final response = await http.put(
        Uri.parse('${ApiUrlConstants.updateLastNameUrl}/$userId/$lastname'));
    return response;
  }

  @override
  Future<Response> updatePassword(int userId, String password) async {
    final response = await http.put(
        Uri.parse('${ApiUrlConstants.updatePasswordUrl}/$userId/$password'));
    return response;
  }

  @override
  Future<Response> updateUserName(int userId, String username) async {
    final response = await http.put(
        Uri.parse('${ApiUrlConstants.updateUserNameUrl}/$userId/$username'));
    return response;
  }
}
