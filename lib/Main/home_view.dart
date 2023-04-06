// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dummyTweet =
      "A group of physicians has volunteered to vaccinate migrants against the flu for free, but US Customs and Border Protection is all but certain to say no to the offer. \"We haven't responded, but it's not likely to happen,\" a CBP official told CNN. ";
  String _url = "https://picsum.photos/id/237/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black, appBar: _appBar, body: _ListView);
  }

  PreferredSizeWidget get _appBar => AppBar(
        elevation: 0,
        toolbarHeight: 59,
        leading: _AppBarAvatar,
        title: _AppBarTitle,
        titleTextStyle: _AppBarIconTitleStyle,
        centerTitle: true,
        backgroundColor: Colors.black,
        bottom: _AppBarDivider,
        actions: [_AppBarIcon],
      );

  Widget get _AppBarAvatar =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        CircleAvatar(radius: 17.5, backgroundImage: NetworkImage(_url)),
      ]);

  Widget get _AppBarTitle => Text("fısılsda");

  TextStyle get _AppBarIconTitleStyle =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 8);

  PreferredSize get _AppBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );

  Widget get _AppBarIcon => IconButton(
        icon: Icon(Icons.email_outlined, size: 24),
        onPressed: () {}, // omitting onPressed makes the button disabled
      );

  Widget get _ListView => ListView.builder(
      itemCount: 5,
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
      leading: _ListAvatar,
      subtitle: _ListContext,
      title: _ListTitle);

  Widget _listCartUserName(String text) => Text(
        text,
        style: titleTextStyle,
      );

  Color get _footerColor => Color.fromRGBO(85, 90, 100, 1.0);

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

  Widget get _ListAvatar => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _ListAvatarChilt);

  Widget get _ListAvatarChilt => CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(_url),
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

  Widget get _ListIconText =>
      Text("121", style: TextStyle(color: _footerColor));

  final titleTextStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white);
}
