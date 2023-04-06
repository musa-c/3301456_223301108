// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:abc/home/pages/main_page/home_view.dart';
import 'package:abc/home/pages/main_page/profile_view.dart';
import 'package:abc/home/pages/main_page/search_view.dart';
import 'package:flutter/material.dart';

class TabBarViewAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabBarViewAbcState();
  }
}

class _TabBarViewAbcState extends State<TabBarViewAbc> {
  String username = '';
  String passw = '';

  final String _url = "https://picsum.photos/id/237/200/300";
  int _selectedTabIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    SearchView(),
    ProfileWiew(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var data = [];
    data = ModalRoute.of(context)?.settings.arguments as List;
    username = data[0];
    passw = data[1];

    return MaterialApp(
      home: Scaffold(
        appBar: _appBar(_selectedTabIndex),
        body: _pages[_selectedTabIndex],
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedTabIndex,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          onTap: _onTabTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_max_outlined), label: "ana ekran"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: username,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: passw,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(index) => AppBar(
        elevation: 0,
        toolbarHeight: 59,
        leading: _AppBarAvatar,
        title: index == 1 ? _AppBarTitleSearch : _AppBarTitle,
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

  Widget get _AppBarTitleSearch => Container(
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
}
