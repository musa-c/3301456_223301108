// ignore_for_file: prefer_const_constructors

import 'package:abc/feature/screens/account_activities_screen.dart';
import 'package:abc/product/models/post_model.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  User? myuser;
  SettingView({super.key, this.myuser});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            _card(
                Icon(
                  Icons.manage_accounts,
                  color: Colors.cyan,
                ),
                "Hesap Ayarları",
                context),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.pie_chart,
                  color: Colors.deepOrange,
                ),
                "Hesap Hareketleri",
                context),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.lock,
                  color: Colors.deepOrangeAccent,
                ),
                "Gizlilik",
                context),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.deepPurple,
                ),
                "Beğeniler",
                context),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.deepOrange,
                ),
                "Beğenilmeyenler",
                context),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.bookmark_border_rounded,
                  color: Colors.green,
                ),
                "Kaydedilen Gönderiler",
                context),
            Divider(
              color: Colors.grey,
            ),
            _card(
                Icon(
                  Icons.info_outline,
                  color: Colors.amber[700],
                ),
                "Kaydedilen Gönderiler",
                context),
            Divider(
              color: Colors.grey,
            ),
          ],
        ));
  }

  Widget _card(Widget icon, String text, BuildContext context) => Card(
        color: Colors.black,
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: false,
                  builder: (context) => Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        bottom: _appBarDivider,
                        backgroundColor: Colors.black,
                        title: Text(text),
                      ),
                      body: AccountActivities(myuser: myuser)),
                ));
          },
          textColor: Colors.white,
          leading: icon,
          title: Text(text),
        ),
      );
}

PreferredSize get _appBarDivider => PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color.fromARGB(255, 52, 52, 52),
      ),
    );
