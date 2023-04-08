// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ListCardUserWidget extends StatefulWidget {
  const ListCardUserWidget({super.key});

  @override
  State<ListCardUserWidget> createState() => _ListCardUserWidgetState();
}

class _ListCardUserWidgetState extends State<ListCardUserWidget> {
  @override
  Widget build(BuildContext context) {
    return _ListViewBuilder;
  }

  Widget get _ListViewBuilder => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return _card;
        },
      );

  Widget get _card => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      margin: const EdgeInsets.all(0),
      child: _CardChild);

  Widget get _CardChild => Container(
        color: Colors.black,
        // padding: EdgeInsets.all(5),
        child: Column(
          children: _childeren,
        ),
      );

  List<Widget> get _childeren => [
        _ListTile,
        const Divider(
          height: 1,
          color: Colors.grey,
        )
      ];

  Widget get _ListTile => ListTile(
      leading: _ListTileLeading,
      title: _ListTileTitle,
      subtitle: _ListTileSubTitle);

  Widget get _ListTileLeading => const CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage('https://source.unsplash.com/random'),
      );

  Widget get _ListTileTitle => const Text(
        'Kullanıcı sdsd',
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
      );

  Widget get _ListTileSubTitle => const Text(
        "@musac",
        style: TextStyle(color: Colors.grey),
      );
}
