// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:abc/feature/screens/chats_screen.dart';
import 'package:abc/feature/screens/home_screen.dart';
import 'package:abc/feature/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../product/models/post_model.dart';
import '../../feature/screens/profile_screen.dart';

class TabBarViewAbc extends StatefulWidget {
  const TabBarViewAbc({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabBarViewAbcState();
  }
}

class _TabBarViewAbcState extends State<TabBarViewAbc> {
  String? username;
  String? passw;
  User user = User();

  int _selectedTabIndex = 0;
  Map<String, dynamic>? data;

  // ignore: prefer_final_fields
  late List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
  }

  _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    user = data!['user'];

    _pages = [HomeView(user: user), SearchView(user: user)];
    // user = data!['user'];
    // data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // print(data['user']);
    // User.fromJson(data!);

    return MaterialApp(
      home: Scaffold(
        appBar: _appBar(_selectedTabIndex, username, passw),
        body: _selectedTabIndex != 2
            ? _pages[_selectedTabIndex]
            : _getPageProfile(),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedTabIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_outlined), label: "ana ekran"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "arama",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "profil",
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPageProfile() {
    return ProfileView(myuser: user, user: user);
  }

  PreferredSizeWidget _appBar(index, username, pasw) => AppBar(
        elevation: 0,
        toolbarHeight: 59,
        // leading: _appBarAvatar(context, username, pasw),
        title: index == 1 ? _appBarTitleSearch : _appBarTitle,
        titleTextStyle: _appBarIconTitleStyle,
        centerTitle: true,
        backgroundColor: Colors.black,
        bottom: _appBarDivider,
        actions: [_appBarIcon],
      );

  // Widget _appBarAvatar(context, username, pasw) =>
  //     Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
  //       InkWell(
  //           onTap: () {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                   fullscreenDialog: false,
  //                   builder: (context) => Scaffold(
  //                       appBar: AppBar(
  //                         bottom: _appBarDivider,
  //                         backgroundColor: Colors.black,
  //                         title: Text("Profil"),
  //                       ),
  //                       body: ProfileView(myuser: user, user: user)),
  //                   // settings: RouteSettings(arguments: {"user": user})
  //                 ));
  //             // Navigator.pushNamed(context, "profile",
  //             //     arguments: {"username": username, "pasw": pasw});
  //           },
  //           child: CircleAvatar(
  //               radius: 17.5,
  //               backgroundImage:
  //                   AssetImage("assets/avatars/${user.avatar!}.jpg"))
  //           // UserData().getAvatar(username) == null
  //           //     ? NetworkImage(_url)
  //           // : NetworkImage(UserData().getAvatar(username)!))
  //           )
  //     ]);

  Widget get _appBarTitle => Text(
        "PAYLAP",
        style: GoogleFonts.raleway(textStyle: TextStyle(letterSpacing: 14)),
      );

  Widget get _appBarTitleSearch => SizedBox(
        height: 28,
        child: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            fillColor: Color(0xFF555A64),
            filled: true,
            hintText: "Ara",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(38),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );

  TextStyle get _appBarIconTitleStyle =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 8);

  PreferredSize get _appBarDivider => PreferredSize(
        preferredSize: Size.fromHeight(1.0),
        child: Divider(
          height: 1,
          thickness: 1,
          color: Color.fromARGB(255, 52, 52, 52),
        ),
      );

  Widget get _appBarIcon => IconButton(
        icon: Icon(Icons.email_outlined, size: 24),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                fullscreenDialog: false,
                builder: (context) => Scaffold(
                    appBar: AppBar(
                      bottom: _appBarDivider,
                      backgroundColor: Colors.black,
                      title: Text("Mesajlar"),
                    ),
                    body: ChatsView()),
              ));
          // Navigator.push(context, 'chats');
        }, // omitting onPressed makes the button disabled
      );
}
