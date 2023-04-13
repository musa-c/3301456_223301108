// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:abc/models/userJson.dart';
import 'package:abc/models/userdata.dart';
import 'package:abc/widgets/button_widget.dart';
import 'package:abc/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../models/userJson.dart';
import 'list_icon_widget.dart';

class ListProfileWidget extends StatefulWidget {
  Widget? listAvatar;
  String? username;
  String? avatar;

  ListProfileWidget({this.listAvatar, super.key, this.username, this.avatar});

  @override
  State<ListProfileWidget> createState() => _ListProfileWidgetState();
}

class _ListProfileWidgetState extends State<ListProfileWidget> {
  final String _url = "https://picsum.photos/id/237/200/300";
  final TextEditingController _textController = TextEditingController();
  String _textData = "";
  User _user = User();

  List<Map<String, dynamic>> userData = [
    {"username": null, "text": []},
    {"username": null, "text": []}
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!(_user.getData(widget.username!).isEmpty)) {
      userData.add(_user.getData(widget.username!));
    }
  }

  void userDataAdd() {
    setState(() {
      // userData[0].addAll({
      //   "name": "",
      //   "username": widget.username!,
      //   "avatar": UserData().getAvatar(widget.username!),
      //   "text": [_textData],
      //   "timestamp": '${DateTime.now().hour}:${DateTime.now().minute}',
      //   "commentCount": 0,
      //   "upCount": 0,
      //   "dowCount": 0,
      //   "bookmarkerCount": 0
      // });

      // UserData().addUser(widget.username!, _textData, );

      userData.add({
        "name": "",
        "text": [_textData],
        "username": widget.username,
        "timestamp": '${DateTime.now().hour}:${DateTime.now().minute}',
        "commentCount": 0,
        "upCount": 0,
        "dowCount": 0,
        "bookmarkerCount": 0
      });

      _user.jsonList.addAll(userData);
      // userData[0]['text'].add(_textData);
      // userData[0]['username'].add(widget.username);
      // userData[0]['username'] = (widget.username!);
      // userData[0]['avatar'] = UserData().getAvatar(widget.username!);
      // userData[0]['timestamp'] =
      //     '${DateTime.now().hour}:${DateTime.now().minute}';
      // userData[0]['commentCount'] = 0;
      // userData[0]['upCount'] = 0;
      // userData[0]['dowCount'] = 0;
      // userData[0]['bookmarkerCount'] = 0;
    });
  }

  // String time() => {
  //   DateTime now = DateTime.now();
  //   String formattedTime = DateFormat('kk:mm:ss').format(now);
  //   return formattedTime.toString();
  // };

  @override
  Widget build(BuildContext context) {
    if (userData.any((element) => element['username'] == widget.username)) {
      print(userData);
      return Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: true,
          floatingActionButton:
              widget.avatar != null ? null : _floatingActionButton,
          body: _listViewBuilder);
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        floatingActionButton:
            widget.avatar != null ? null : _floatingActionButton,
        body: _text,
      );
    }
  }

  Widget get _text => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Henüz bir şey yazmadınız",
            style: TextStyle(color: Colors.grey, fontSize: 18),
          )
        ],
      ));

  Widget get _floatingActionButton => FloatingActionButton(
      backgroundColor: Colors.black,
      elevation: 2,
      focusColor: Colors.black,
      splashColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.deepPurple, // Sınır rengi
            width: 2, // Sınır kalınlığı
          ),
          borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        _showDialog;
      },
      child: Icon(Icons.add));

  Future<dynamic> get _showDialog => showDialog(
        context: context,
        // useRootNavigator: true,
        builder: (BuildContext context) {
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: _textController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(60, 60, 67, 0.6)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(60, 60, 67, 0.6)),
                        ),
                        hintText: 'birşeyler yaz...',
                        filled: true,
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Color.fromRGBO(60, 60, 67, 0.6),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                      ),
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      validator: (value) {
                        // Geçerlilik denetimi yapılabilir
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          _textData = value;
                        });
                        // Metin değiştiğinde yapılacak işlemler
                      },
                    ),
                  ),
                  ButtonWidget(
                      onPressed: () {
                        userDataAdd();
                      },
                      child: Text("Gönder gitsin"))
                ],
              ));
        },
      );

  Widget get _listViewBuilder => ListView.builder(
      itemCount: userData.length,
      itemBuilder: (context, index) {
        final item = userData[index];
        return Column(
          children: item['text'].map<Widget>((text) {
            return _listCont(index, text);
          }).toList(),
        );
      });

  Widget _listCont(index, text) => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _listContBorder,
      ),
      child: _listTile(index, text));

  Border get _listContBorder => const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget _listTile(index, text) => ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: _listAvatar(index),
      subtitle: _listContext(index, text),
      title: _listTitle(index));

  Widget _listAvatar(index) => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _listAvatarChilt(index));

  Widget _listAvatarChilt(index) => CircleAvatar(
        radius: 24,
        backgroundImage: UserData().getAvatar(widget.username!) == null
            ? NetworkImage(_url)
            : NetworkImage(UserData().getAvatar(widget.username!)!),
      );

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget _listContext(index, text) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.start,
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
                  count: userData[index]['commentCount'],
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.arrow_upward_rounded,
                  count: userData[index]['upCount'],
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.arrow_downward_rounded,
                  count: userData[index]['dowCount'],
                  onTap: () {},
                ),
                ListIconWidget(
                  icon: Icons.bookmark_border_rounded,
                  count: userData[index]['bookmarkerCount'],
                  onTap: () {},
                ),
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
          _listCartUserName(userData[index]['username'].toString()),
        ],
      );
  Widget _listTimeStamp(index) => Text(
        userData[index]['timestamp'].toString(),
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
