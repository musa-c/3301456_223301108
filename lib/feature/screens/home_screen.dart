// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:abc/product/models/post_model.dart';
import 'package:abc/product/widgets/list_builder_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  User user = User();
  HomeView({super.key, required this.user});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, body: _ListView);
  }

  Widget get _ListView => ListBuilderWidget(user: widget.user);
}
