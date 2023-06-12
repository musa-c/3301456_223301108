// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            _card(
                Icon(
                  Icons.person,
                  color: Colors.cyan,
                ),
                "Hesap Ayarları"),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.lock,
                  color: Colors.deepOrangeAccent,
                ),
                "Gizlilik"),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.deepPurple,
                ),
                "Beğeniler"),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.deepOrange,
                ),
                "Beğenilmeyenler"),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.green,
                ),
                "Kaydedilen Gönderiler"),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.info_outline,
                  color: Colors.amber[700],
                ),
                "Kaydedilen Gönderiler"),
            Divider(
              color: Colors.grey,
            ),
          ],
        ));
  }

  Widget _card(Widget icon, String text) => Card(
        color: Colors.black,
        child: ListTile(
          textColor: Colors.white,
          leading: icon,
          title: Text(text),
        ),
      );
}
