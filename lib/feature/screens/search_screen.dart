// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abc/product/models/post_model.dart';
import 'package:flutter/material.dart';

import '../../product/widgets/list_card_user_search_widget.dart';

class SearchView extends StatefulWidget {
  User user = User();
  SearchView({super.key, required this.user});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: ListCardUserSearch(myuser: widget.user),
    );
  }
}
