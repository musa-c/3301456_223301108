import 'package:abc/product/models/post_model.dart';
import 'package:abc/product/widgets/button_widget.dart';
import 'package:abc/product/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class ListCommentUserWidget extends StatefulWidget {
  int? postId;
  User? myuser;
  ListCommentUserWidget({super.key, this.postId, this.myuser});

  @override
  State<ListCommentUserWidget> createState() => _ListCommentUserWidgetState();
}

class _ListCommentUserWidgetState extends State<ListCommentUserWidget> {
  void getComment() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _appBarDivider,
        const ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage('assets/avatars/237.jpg'), // Avatar görüntüsü
          ),
          title: Text(
            'Kart Başlığı',
            style: TextStyle(color: Colors.white),
          ), // Kart başlığı
          subtitle: Text('Kart alt başlığı',
              style: TextStyle(color: Colors.white)), // Kart alt başlığı
        ),
        _appBarDivider,
        TextFieldWidget(
          hintText: "hintText",
        ),
        ButtonWidget(onPressed: () {}, child: const Text("gönder")),
      ],
    );
  }
}

PreferredSize get _appBarDivider => const PreferredSize(
      preferredSize: Size.fromHeight(1.0),
      child: Divider(
        height: 1,
        thickness: 1,
        color: ColorConstants.dividerColor,
      ),
    );
