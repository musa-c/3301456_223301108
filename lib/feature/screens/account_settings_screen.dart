import 'package:abc/feature/screens/user_data_update_screen.dart';
import 'package:flutter/material.dart';

import '../../product/models/post_model.dart';

class AccountSettingsView extends StatefulWidget {
  User? myuser = User();
  AccountSettingsView({super.key, this.myuser});

  @override
  State<AccountSettingsView> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            _card(
                const Icon(
                  Icons.account_circle_rounded,
                  color: Colors.cyan,
                ),
                "Kullanıcı Adı",
                "Kullanıcı Adını",
                widget.myuser!.id!,
                context),
            const Divider(
              color: Colors.grey,
            ),
            _card(
                const Icon(
                  Icons.edit_note,
                  color: Colors.deepOrange,
                ),
                "İsim",
                "İsmini",
                widget.myuser!.id!,
                context),
            const Divider(
              color: Colors.grey,
            ),
            _card(
                const Icon(
                  Icons.edit_note,
                  color: Colors.deepOrangeAccent,
                ),
                "Soy isim",
                "Soy ismini",
                widget.myuser!.id!,
                context),
            const Divider(
              color: Colors.grey,
            ),
            _card(
                const Icon(
                  Icons.email,
                  color: Colors.deepPurple,
                ),
                "Email",
                "Emailini",
                widget.myuser!.id!,
                context),
            const Divider(
              color: Colors.grey,
            ),
            _card(
                const Icon(
                  Icons.lock,
                  color: Colors.deepOrange,
                ),
                "Şifre",
                "Şifreni",
                widget.myuser!.id!,
                context),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ));
  }
}

Widget _card(Widget icon, String text, String whichUpdate, int userId,
        BuildContext context) =>
    Card(
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
                    body: UserDataUpdateView(
                      text: text,
                      whichUpdate: whichUpdate,
                      userId: userId,
                    )),
              ));
        },
        textColor: Colors.white,
        leading: icon,
        title: Text(text),
      ),
    );

PreferredSize get _appBarDivider => const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color.fromARGB(255, 52, 52, 52),
      ),
    );
