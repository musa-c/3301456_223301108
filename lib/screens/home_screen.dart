// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:abc/widgets/list_builder_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dummyTweet =
      "A group of physicians has volunteered to vaccinate migrants against the flu for free, but US Customs and Border Protection is all but certain to say no to the offer. \"We haven't responded, but it's not likely to happen,\" a CBP official told . ";

  final String _url = "https://picsum.photos/id/237/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _ListView);
  }

  Widget get _ListView => ListBuilderWidget(
        listAvatar: _listAvatar,
      );

  Widget get _listAvatar => Container(
      height: double.infinity,
      // ignore: sized_box_for_whitespace
      margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
      child: _listAvatarChilt);

  Widget get _listAvatarChilt => CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(_url),
      );
}
