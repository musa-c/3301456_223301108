// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:abc/models/userJson.dart';
import 'package:flutter/material.dart';

import '../models/userJson.dart';
import 'list_icon_widget.dart';

class ListBuilderWidget extends StatefulWidget {
  Widget? listAvatar;
  User? user;

  ListBuilderWidget({this.listAvatar, super.key, this.user});

  @override
  State<ListBuilderWidget> createState() => _ListBuilderWidgetState();
}

class _ListBuilderWidgetState extends State<ListBuilderWidget> {
  User _user = User();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _user.jsonList.length,
        itemBuilder: (context, index) {
          return _listCont(index);
        });
  }

  Widget _listCont(index) => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _listContBorder,
      ),
      child: _listTile(index));

  Border get _listContBorder => const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget _listTile(index) => ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: _listAvatar(index),
      subtitle: _listContext(index),
      title: _listTitle(index));

  Widget _listAvatar(index) => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _listAvatarChilt(index));

  Widget _listAvatarChilt(index) => CircleAvatar(
        radius: 24,
        backgroundImage:
            NetworkImage('https://picsum.photos/id/${index + 9}/200/300'),
      );

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget _listContext(index) => Column(
        children: [
          Text(
            _user.jsonList[index]['text'].toString(),
            style: TextStyle(
                color: Color.fromRGBO(255, 250, 250, 1),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 14.6, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListIconWidget(
                    icon: Icons.messenger_outline_rounded,
                    count: _user.jsonList[index]['commentCount']),
                ListIconWidget(
                    icon: Icons.arrow_upward_rounded,
                    count: _user.jsonList[index]['upCount']),
                ListIconWidget(
                    icon: Icons.arrow_downward_rounded,
                    count: _user.jsonList[index]['dowCount']),
                ListIconWidget(
                    icon: Icons.bookmark_border_rounded,
                    count: _user.jsonList[index]['bookmarkerCount']),
              ],
            ),
          )
        ],
      );

  Widget _listTitle(index) => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_listUserName(index), _listTimeStamp(index)],
        ),
      );

  Widget _listUserName(index) => Wrap(
        direction: Axis.horizontal,
        runSpacing: 3,
        children: [
          _listCartUserName(_user.jsonList[index]['name'].toString()),
        ],
      );
  Widget _listTimeStamp(index) => Text(
        _user.jsonList[index]['timestamp'].toString(),
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
