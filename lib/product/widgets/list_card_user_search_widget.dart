import 'dart:convert';

import 'package:flutter/material.dart';

import '../../feature/screens/profile_screen.dart';
import '../models/post_model.dart';
import 'package:http/http.dart' as http;

class ListCardUserSearch extends StatefulWidget {
  User myuser = User();

  ListCardUserSearch({super.key, required this.myuser});

  @override
  State<ListCardUserSearch> createState() => _ListCardUserSearchState();
}

class _ListCardUserSearchState extends State<ListCardUserSearch> {
  final String _url = "https://picsum.photos/id/237/200/300";
  List<User>? users = [];

  void getUser() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.6:45455/api/users'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<User> postList =
          jsonResponse.map((item) => User.fromJson(item)).toList();
      setState(() {
        users = postList;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return _ListViewBuilder;
  }

  Widget get _ListViewBuilder => ListView.builder(
        itemCount: users!.length,
        itemBuilder: (context, index) {
          User user = users![index];
          return user.id != widget.myuser.id ? _card(user) : Container();
        },
      );

  Widget _card(User user) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: const EdgeInsets.all(0),
      child: _CardChild(user));

  Widget _CardChild(User user) => Container(
        color: Colors.black,
        // padding: EdgeInsets.all(5),
        child: Column(
          children: _childeren(user),
        ),
      );

  List<Widget> _childeren(User user) => [
        _ListTile(user),
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ];

  Widget _ListTile(User user) => ListTile(
      leading: _ListTileLeading(user),
      title: _ListTileTitle(user),
      subtitle: _ListTileSubTitle(user));

  Widget _ListTileLeading(User user) => InkWell(
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
                    user: user,
                    myuser: widget.myuser,
                  )),
            ));
      },
      child: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(_url),
      ));

  Widget _ListTileTitle(User user) => Text(
        user.userName!,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      );

  Widget _ListTileSubTitle(User user) => Text(
        user.firstName ?? "",
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
