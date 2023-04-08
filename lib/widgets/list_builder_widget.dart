// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'list_icon_widget.dart';

class ListBuilderWidget extends StatefulWidget {
  Widget? listAvatar;
  ListBuilderWidget({this.listAvatar, super.key});

  @override
  State<ListBuilderWidget> createState() => _ListBuilderWidgetState();
}

class _ListBuilderWidgetState extends State<ListBuilderWidget> {
  String dummyTweet =
      "A group of physicians has volunteered to vaccinate migrants against the flu for free, but US Customs and Border Protection is all but certain to say no to the offer. \"We haven't responded, but it's not likely to happen,\" a CBP official told . ";

  final String _url = "https://picsum.photos/id/237/200/300";

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return _listCont;
        });
  }

  Widget get _listCont => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _listContBorder,
      ),
      child: _listTile);

  Border get _listContBorder => const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget get _listTile => ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      leading: widget.listAvatar,
      subtitle: _listContext,
      title: _listTitle);

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _listContext => Column(
        children: [
          Text(
            dummyTweet,
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
                ListIconWidget(icon: Icons.messenger_outline_rounded),
                ListIconWidget(icon: Icons.arrow_upward_rounded),
                ListIconWidget(icon: Icons.arrow_downward_rounded),
                ListIconWidget(icon: Icons.bookmark_border_rounded),
              ],
            ),
          )
        ],
      );

  Widget get _listTitle => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_listUserName, _listTimeStamp],
        ),
      );

  Widget get _listUserName => Wrap(
        direction: Axis.horizontal,
        runSpacing: 3,
        children: [
          _listCartUserName("mss"),
        ],
      );
  Widget get _listTimeStamp => Text(
        "02:3",
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
