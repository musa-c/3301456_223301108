import 'dart:convert';

import 'package:abc/product/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../product/api/controllers/concrete/user_controller.dart';
import '../../product/constants/color_constants.dart';

class AvatarSelect extends StatefulWidget {
  User? myuser = User();
  void Function()? callbackGetPost;
  AvatarSelect({super.key, this.myuser, this.callbackGetPost});

  @override
  State<AvatarSelect> createState() => _AvatarSelectState();
}

class _AvatarSelectState extends State<AvatarSelect> {
  void avatarUpdate(int index, BuildContext context) async {
    final http.Response response;

    String updateAvatar = "${[111, 237, 238, 251, 267, 300, 301, 450][index]}";
    print(updateAvatar);

    UserController userController = UserController();
    response =
        await userController.updateAvatar(widget.myuser!.id!, updateAvatar);

    if (response.statusCode == 200) {
      widget.callbackGetPost;
      // ignore: use_build_context_synchronously

      // ignore: use_build_context_synchronously
      Navigator.pop(
        context,
        User.fromJson(json.decode(response.body)),
      );

      Fluttertoast.showToast(
        msg: "Profil resmi değiştirildi.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: ColorConstants.blackColor,
        textColor: ColorConstants.purpleColor,
        webPosition: "center",
        webBgColor: "#808080",
        fontSize: 16.0,
      );
    } else {
      print(response.statusCode);
      print(response.body);

      // throw Exception('Failed to update avatar');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            // margin: EdgeInsets.only(top: index == 0 ? 30 : 0, right: 12),
            child: GestureDetector(
          onTap: () {
            avatarUpdate(index, context);
          },
          child: Image(
            image: AssetImage("assets/avatars/${[
              111,
              237,
              238,
              251,
              267,
              300,
              301,
              450
            ][index]}.jpg"),
          ),
        ));
      },
    );
  }
}
