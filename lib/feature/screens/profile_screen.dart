// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:abc/feature/screens/setting_screen.dart';
import 'package:abc/product/widgets/list_profile_user_widget.dart';
import 'package:flutter/material.dart';

import "package:abc/product/models/post_model.dart";

class ProfileView extends StatefulWidget {
  User? user = User();
  User? myuser = User();
  ProfileView({super.key, this.user, this.myuser});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final String _url = "https://picsum.photos/id/237/200/300";
  // Map<String, dynamic>? data;
  // User userargs = User();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // userargs = data!['user'];
    // print("profileargs:");
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user?.avatar);
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
      child: widget.user?.avatar != null
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
          children: [
            _ProfileAvatar,
            _ProfileUserName,
            _ProfileFirstLastName(),
          ],
        ),
      ]);

  Widget get _ProfileAvatar => CircleAvatar(
        backgroundImage:
            widget.user?.avatar == "" || widget.user?.avatar == null
                ? NetworkImage(_url)
                : null,
        radius: 40,
      );

  Widget get _ProfileUserName => Container(
        margin: EdgeInsets.all(20),
        child: Text(
          widget.user!.userName!,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      );

  Widget _ProfileFirstLastName() {
    if (widget.user?.firstName != null && widget.user?.lastName != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.user!.firstName!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(widget.user!.lastName!,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white))
            ],
          )
        ],
      );
    } else if (widget.user?.firstName != null) {
      return Text(widget.user!.firstName!,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white));
    } else if (widget.user?.lastName != null) {
      return Text(widget.user!.firstName!,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white));
    } else {
      return Container();
    }
  }

  // Widget get _ProfileUserName => Text(
  //       "şifre:" + passw!,
  //       style: TextStyle(color: Colors.white),
  //     );

  Widget get _ListViewExpanded => Expanded(
      flex: 2, child: SizedBox(width: double.infinity, child: _ListView));

  Widget get _ListView =>
      ListProfileWidget(myuser: widget.myuser, user: widget.user);

  PreferredSize get _appBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );
}
