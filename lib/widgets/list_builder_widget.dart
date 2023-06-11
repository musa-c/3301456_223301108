// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'list_icon_widget.dart';
// import 'package:animated_icon/animate_icons.dart';

class ListBuilderWidget extends StatefulWidget {
  const ListBuilderWidget({super.key});

  @override
  State<ListBuilderWidget> createState() => _ListBuilderWidgetState();
}

class _ListBuilderWidgetState extends State<ListBuilderWidget> {
  @override
  void initState() {
    super.initState();
  }

  void setUpCount(String username, int index) {
    setState(() {
      // _user.setUserUpCount(username, index);
    });
  }

  void setDownCount(String username, int index) {
    setState(() {
      // _user.setDownCount(username, index);
    });
  }

  void setBookmarkerCount(String username, int index) {
    setState(() {
      // _user.setBookMarkerCount(username, index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          // final item = _user.jsonList[index];
          return _listCont();
        });
  }

  Widget _listCont() => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _listContBorder,
      ),
      child: _listTile());

  Border get _listContBorder => const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget _listTile() => ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: _listAvatar(),
      subtitle: _listContext(),
      title: _listTitle());

  Widget _listAvatar() => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _listAvatarChilt());

  Widget _listAvatarChilt() => InkWell(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       settings: RouteSettings(arguments: {
        //         "username": _user.jsonList[index]["username"],
        //         "avatar": _user.jsonList[index]['avatar']
        //       }),
        //       fullscreenDialog: false,
        //       builder: (context) => Scaffold(
        //           appBar: AppBar(
        //             bottom: _appBarDivider,
        //             backgroundColor: Colors.black,
        //             title: Text("Profil"),
        //           ),
        //           body: ProfileView()),
        //     ));
      },
      child: CircleAvatar(
        radius: 24,
        // backgroundImage: NetworkImage(_user.jsonList[index]['avatar']),
      ));

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget _listContext() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "merhaba",
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
                    count: 12,
                    onTap: () {}),
                ListIconWidget(
                  icon: Icons.arrow_upward_rounded,
                  count: 10,
                  onTap: () {
                    // setUpCount(_user.jsonList[index]['username'], index);
                  },
                ),
                ListIconWidget(
                  icon: Icons.arrow_downward_rounded,
                  count: 0,
                  onTap: () {
                    // setDownCount(_user.jsonList[index]['username'], index);
                  },
                ),
                ListIconWidget(
                  icon: Icons.bookmark_border_rounded,
                  count: 7,
                  onTap: () {
                    // setBookmarkerCount(
                    //     _user.jsonList[index]['username'], index);
                  },
                ),
              ],
            ),
          )
        ],
      );

  Widget _listTitle() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_listUserName(), _listTimeStamp()],
        ),
      );

  Widget _listUserName() => Wrap(
        direction: Axis.horizontal,
        runSpacing: 3,
        children: const [
          Text(
            "musaasa",
            style: TextStyle(color: Colors.amberAccent),
          )
        ],
      );
  Widget _listTimeStamp() => Text(
        "time",
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);

  PreferredSize get _appBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );
}
