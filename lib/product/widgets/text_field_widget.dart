// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  String hintText;
  IconButton? iconButton;
  final ValueChanged<String>? onDataChanged;
  bool? sifregizle;
  TextEditingController? controller;
  TextFieldWidget(
      {this.onDataChanged,
      super.key,
      required this.hintText,
      this.iconButton,
      this.sifregizle,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 44,
        width: 380,
        child: TextField(
            controller: controller,
            obscureText: sifregizle ?? false,
            style: const TextStyle(color: Colors.white),
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
        contentPadding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
        filled: true,
        //focusedBorder: outlineInputBorder,
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color.fromRGBO(60, 60, 67, 0.6),
      );
}
