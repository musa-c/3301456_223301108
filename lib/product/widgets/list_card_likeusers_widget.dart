import 'package:abc/product/controllers/concrete/likes_controller.dart';
import 'package:abc/product/widgets/list_card_user_widget.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class ListCardLikeUsers extends StatefulWidget {
  int postId;
  User? myuser;
  ListCardLikeUsers({super.key, required this.postId, this.myuser});

  @override
  State<ListCardLikeUsers> createState() => _ListCardLikeUsersState();
}

class _ListCardLikeUsersState extends State<ListCardLikeUsers> {
  List<Post>? posts = [];

  void getLikeUsers() async {
    LikeController likeController = LikeController();
    try {
      List<Post> postList =
          await likeController.getUserLikesByPostId(widget.postId);
      setState(() {
        posts = postList;
      });
    } catch (e) {
      print(e);
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
