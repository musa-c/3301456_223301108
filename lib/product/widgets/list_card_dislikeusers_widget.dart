import 'dart:convert';

import 'package:abc/product/controllers/concrete/dislike_controller.dart';
import 'package:flutter/material.dart';
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

  void getDislikeUsers() async {
    DislikesController dislikesController = DislikesController();
    final response =
        await dislikesController.getUserDislikesByPostId(widget.postId);

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
    getDislikeUsers();
  }

  @override
  Widget build(BuildContext context) {
    return ListCardUserWidget(
      users: posts,
      myuser: widget.myuser,
    );
  }
}
