import 'package:flutter/material.dart';

import '../../feature/screens/profile_screen.dart';
import '../models/post_model.dart';

class ListCardUserWidget extends StatefulWidget {
  List<Post>? users;
  User? myuser;
  ListCardUserWidget({super.key, this.users, this.myuser});

  @override
  State<ListCardUserWidget> createState() => _ListCardUserWidgetState();
}

class _ListCardUserWidgetState extends State<ListCardUserWidget> {
  @override
  Widget build(BuildContext context) {
    return _ListViewBuilder;
  }

  Widget get _ListViewBuilder => ListView.builder(
        itemCount: widget.users!.length,
        itemBuilder: (context, index) {
          Post post = widget.users![index];
          return _card(post);
        },
      );

  Widget _card(Post post) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: const EdgeInsets.all(0),
      child: _CardChild(post));

  Widget _CardChild(Post post) => Container(
        color: Colors.black,
        // padding: EdgeInsets.all(5),
        child: Column(
          children: _childeren(post),
        ),
      );

  List<Widget> _childeren(Post post) => [
        _ListTile(post),
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ];

  Widget _ListTile(Post post) => ListTile(
      leading: _ListTileLeading(post),
      title: _ListTileTitle(post),
      subtitle: _ListTileSubTitle(post));

  Widget _ListTileLeading(Post post) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              // settings: RouteSettings(arguments: {
              //   "username": _user.jsonList[index]["username"],
              //   "avatar": _user.jsonList[index]['avatar']
              // }),
              fullscreenDialog: false,
              builder: (context) => Scaffold(
                  appBar: AppBar(
                    bottom: _appBarDivider,
                    backgroundColor: Colors.black,
                    title: const Text("Profil"),
                  ),
                  body: ProfileView(
                    user: post.user,
                    myuser: widget.myuser,
                  )),
            ));
      },
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage("assets/avatars/${post.user!.avatar!}.jpg"),
      ));

  Widget _ListTileTitle(Post post) => Text(
        post.user!.userName!,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      );

  Widget _ListTileSubTitle(Post post) => Text(
        post.user?.firstName ?? "",
        // post.user?.lastName ?? "",

        // "@${_user.jsonList[index]['username']}",
        style: const TextStyle(color: Colors.grey),
      );

  PreferredSize get _appBarDivider => const PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );
}
