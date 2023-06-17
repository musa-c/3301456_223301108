import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/post_model.dart';
import 'package:http/http.dart' as http;

import 'list_card_user_widget.dart';

class ListCardBookMarkUsers extends StatefulWidget {
  int postId;
  User? myuser;
  ListCardBookMarkUsers({super.key, required this.postId, this.myuser});

  @override
  State<ListCardBookMarkUsers> createState() => _ListCardBookMarkUsersState();
}

class _ListCardBookMarkUsersState extends State<ListCardBookMarkUsers> {
  List<Post>? posts = [];

  void getLikeUsers() async {
    final response = await http.get(Uri.parse(
        'http://192.168.1.6:45455/api/bookmarkers/GetUserBookMarkByPostId/${widget.postId}'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<Post> postList =
          jsonResponse.map((item) => Post.fromJson(item)).toList();
      setState(() {
        posts = postList;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLikeUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ListCardUserWidget(users: posts, myuser: widget.myuser);
  }
}
