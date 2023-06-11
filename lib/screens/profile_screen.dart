// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:abc/screens/setting_screen.dart';
import 'package:abc/widgets/list_profile_user_widget.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  String? username;
  String? passw;

  ProfileView({
    super.key,
    this.username,
    this.passw,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String _url = "https://picsum.photos/id/237/200/300";
  Map<dynamic, dynamic>? args;
  String? username;
  String? avatar;
  String? passw;
  // User _user = User();

  @override
  void initState() {
    super.initState();
  }

  void userNameAndPasswSet(username, pasw) {
    setState(() {
      username = username;
      passw = pasw;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    args = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    // username = widget.username ?? args?['username'];
    // avatar = args?['avatar'];
    // passw = widget.passw ?? args?['pasw'];
    userNameAndPasswSet(username, passw);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _ProfileContext);
  }

  Widget get _ProfileContext => Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _ProfileSettingIcon,
            _ProfileAvatarUserName,
            _ListViewExpanded
          ],
        ),
      );

  Widget get _ProfileSettingIcon => Container(
      margin: EdgeInsets.fromLTRB(0, 12, 12, 0),
      child: avatar != null
          ? null
          : InkWell(
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
                            title: Text("Ayarlar"),
                          ),
                          body: SettingView()),
                    ));
              },
              child: Icon(
                Icons.settings,
                color: Colors.white,
              )));

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
          children: [_ProfileAvatar, _ProfileUserNameSurname],
        ),
      ]);

  Widget get _ProfileAvatar => CircleAvatar(
        backgroundImage: NetworkImage(_url),
        // UserData().getAvatar(username!) == null
        //     ? NetworkImage(avatar ?? _url)
        //     :
        //     NetworkImage(UserData().getAvatar(username!)!),
        radius: 40,
      );

  Widget get _ProfileUserNameSurname => Container(
        margin: EdgeInsets.all(20),
        child: Text(
          "musac",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );

  // Widget get _ProfileUserName => Text(
  //       "şifre:" + passw!,
  //       style: TextStyle(color: Colors.white),
  //     );

  Widget get _ListViewExpanded => Expanded(
      flex: 2, child: SizedBox(width: double.infinity, child: _ListView));

  Widget get _ListView => ListProfileWidget();

  PreferredSize get _appBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );
}
