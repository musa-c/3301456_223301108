// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final String _url = "https://picsum.photos/id/237/200/300";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              margin: EdgeInsets.all(0),
              child: Container(
                color: Colors.black,
                // padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage:
                            NetworkImage('https://source.unsplash.com/random'),
                      ),
                      title: Text(
                        'Kullanıcı sdsd',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        "@musac",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
