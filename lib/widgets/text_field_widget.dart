import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  IconButton? iconButton;
  final ValueChanged<String>? onDataChanged;
  bool? sifregizle;

  TextFieldWidget(
      {this.onDataChanged,
      super.key,
      required this.hintText,
      this.iconButton,
      this.sifregizle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 44,
        width: 380,
        child: TextField(
            obscureText: sifregizle ?? false,
            style: TextStyle(color: Colors.white),
            onChanged: (text) {
              if (onDataChanged != null) {
                onDataChanged!(text);
              }
            },
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            maxLines: 1,
            decoration: _InputDecoration),
      ),
    );
  }

  InputDecoration get _InputDecoration => InputDecoration(
        suffixIcon: iconButton,
        contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
        filled: true,
        //focusedBorder: outlineInputBorder,
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Color.fromRGBO(60, 60, 67, 0.6),
      );
}
