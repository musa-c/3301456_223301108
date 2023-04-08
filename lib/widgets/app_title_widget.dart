// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class AppTitleWidget extends StatelessWidget {
  final String app_title;

  const AppTitleWidget({required this.app_title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(0, 80, 0, 48),
        child: Text(
          app_title,
          textAlign: TextAlign.center,
          style: _TextAppTitleWidgetStyle,
        ));
  }

  TextStyle get _TextAppTitleWidgetStyle => TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins', // çalışmıyor!
      fontSize: 20,
      fontWeight: FontWeight.w800,
      fontStyle: FontStyle.normal,
      letterSpacing: 14);
}
