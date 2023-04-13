// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:abc/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../models/userJson.dart';

class ListCardUserWidget extends StatefulWidget {
  const ListCardUserWidget({super.key});

  @override
  State<ListCardUserWidget> createState() => _ListCardUserWidgetState();
}

class _ListCardUserWidgetState extends State<ListCardUserWidget> {
  User _user = User();

  @override
  Widget build(BuildContext context) {
    return _ListViewBuilder;
  }

  Widget get _ListViewBuilder => ListView.builder(
        itemCount: _user.jsonList.length,
        itemBuilder: (context, index) {
          return _card(index);
        },
      );

  Widget _card(index) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: const EdgeInsets.all(0),
      child: _CardChild(index));

  Widget _CardChild(index) => Container(
        color: Colors.black,
        // padding: EdgeInsets.all(5),
        child: Column(
          children: _childeren(index),
        ),
      );

  List<Widget> _childeren(index) => [
        _ListTile(index),
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ];

  Widget _ListTile(index) => ListTile(
      leading: _ListTileLeading(index),
      title: _ListTileTitle(index),
      subtitle: _ListTileSubTitle(index));

  Widget _ListTileLeading(index) => InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              settings: RouteSettings(arguments: {
                "username": _user.jsonList[index]["username"],
                "avatar": _user.jsonList[index]['avatar']
              }),
              fullscreenDialog: false,
              builder: (context) => Scaffold(
                  appBar: AppBar(
                    bottom: _appBarDivider,
                    backgroundColor: Colors.black,
                    title: Text("Profil"),
                  ),
                  body: ProfileView()),
            ));
      },
      child: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(_user.jsonList[index]['avatar']),
      ));

  Widget _ListTileTitle(index) => Text(
        _user.jsonList[index]['name'],
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      );

  Widget _ListTileSubTitle(index) => Text(
        "@${_user.jsonList[index]['username']}",
        style: TextStyle(color: Colors.grey),
      );

  PreferredSize get _appBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );
}
