import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';
import 'list_card_user_widget.dart';

class ListCardDislikeUsers extends StatefulWidget {
  int postId;
  User? myuser;
  ListCardDislikeUsers({super.key, required this.postId, this.myuser});

  @override
  State<ListCardDislikeUsers> createState() => _ListCardDislikeUsersState();
}

class _ListCardDislikeUsersState extends State<ListCardDislikeUsers> {
  List<Post>? posts = [];

  void getLikeUsers() async {
    final response = await http.get(Uri.parse(
        'http://localhost:26342/api/dislikes/GetUserDislikesByPostId/${widget.postId}'));
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
    return ListCardUserWidget(
      users: posts,
      myuser: widget.myuser,
    );
  }
}
