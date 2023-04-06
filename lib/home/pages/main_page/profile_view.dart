// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class ProfileWiew extends StatefulWidget {
  const ProfileWiew({super.key});

  @override
  State<ProfileWiew> createState() => _ProfileWiewState();
}

class _ProfileWiewState extends State<ProfileWiew> {
  String dummyTweet =
      "A group of physicians has volunteered to vaccinate migrants against the flu for free, but US Customs and Border Protection is all but certain to say no to the offer. \"We haven't responded, but it's not likely to happen,\" a CBP official told CNN. ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _ProfileContext);
  }

  Widget get _ProfileContext => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _ProfileSettingIcon,
          _ProfileAvatarUserName,
          _ListViewExpanded
        ],
      );

  Widget get _ProfileSettingIcon => Container(
        margin: EdgeInsets.fromLTRB(0, 12, 12, 0),
        child: Icon(
          Icons.settings,
          color: Colors.white,
        ),
      );

  Widget get _ProfileAvatarUserName => Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_ProfileAvatarWrap],
          ),
        ),
      );

  Widget get _ProfileAvatarWrap => Wrap(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_ProfileAvatar, _ProfileUserNameSurname, _ProfileUserName],
        ),
      ]);

  Widget get _ProfileAvatar => CircleAvatar(
        backgroundColor: Colors.grey,
        radius: 40,
      );

  Widget get _ProfileUserNameSurname => Text(
        "kullanıcı adı",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      );

  Widget get _ProfileUserName => Text(
        "@kullanıcı_adı",
        style: TextStyle(color: Colors.white),
      );

  Widget get _ListViewExpanded => Expanded(
      flex: 3, child: Container(width: double.infinity, child: _ListView));

  Widget get _ListView => ListView.builder(
      itemCount: 5,
      padding: EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return _ListCont;
      });

  Widget get _ListCont => Container(
      decoration: BoxDecoration(
        color: Colors.black,
        border: _ListContBorder,
      ),
      child: _ListTile);

  Border get _ListContBorder => Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
      top: BorderSide(width: 0),
      right: BorderSide(width: 0),
      left: BorderSide(width: 0));

  Widget get _ListTile => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      subtitle: _ListContext,
      title: _ListTitle);

  Widget get _ListTitle => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_ListUserName, _ListTimeStamp],
        ),
      );

  Widget get _ListUserName => Wrap(
        direction: Axis.horizontal,
        runSpacing: 3,
        children: [
          _listCartUserName("musa civelek"),
        ],
      );
  Widget get _ListTimeStamp => Text(
        "02:3",
        style:
            TextStyle(fontSize: 14, color: Color.fromRGBO(203, 208, 217, 1.0)),
      );

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Widget get _ListContext => Column(
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
                _ListIconMessenger_outline_rounded,
                _ListIconArrow_upward_rounded,
                _ListIconArrow_downward_rounded,
                _ListIconBookmark_border_rounded,
              ],
            ),
          )
        ],
      );

  Widget get _ListIconMessenger_outline_rounded => InkWell(
        onTap: () {},
        child: Wrap(spacing: 5, children: [
          Icon(
            Icons.messenger_outline_rounded,
            color: _footerColor,
            size: 14,
          ),
          _ListIconText
        ]),
      );

  Widget get _ListIconArrow_upward_rounded => InkWell(
        onTap: () {},
        child: Wrap(spacing: 5, children: [
          Icon(
            Icons.arrow_upward_rounded,
            color: _footerColor,
            size: 14,
          ),
          _ListIconText
        ]),
      );

  Widget get _ListIconArrow_downward_rounded => InkWell(
        onTap: () {},
        child: Wrap(spacing: 5, children: [
          Icon(
            Icons.arrow_downward_rounded,
            color: _footerColor,
            size: 14,
          ),
          _ListIconText
        ]),
      );

  Widget get _ListIconBookmark_border_rounded => InkWell(
        onTap: () {},
        child: Wrap(spacing: 5, children: [
          Icon(
            Icons.bookmark_border_rounded,
            color: _footerColor,
            size: 14,
          ),
          _ListIconText
        ]),
      );

  Color get _footerColor => Color.fromRGBO(85, 90, 100, 1.0);

  Widget get _ListIconText =>
      Text("121", style: TextStyle(color: _footerColor));

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
