import 'package:abc/product/api/controllers/concrete/user_controller.dart';
import 'package:abc/product/constants/color_constants.dart';
import 'package:abc/product/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../product/widgets/text_field_widget.dart';

class UserDataUpdateView extends StatefulWidget {
  final String text;
  final String whichUpdate;
  final int userId;
  const UserDataUpdateView({
    Key? key,
    required this.text,
    required this.whichUpdate,
    required this.userId,
  }) : super(key: key);

  @override
  State<UserDataUpdateView> createState() => _UserDataUpdateViewState();
}

class _UserDataUpdateViewState extends State<UserDataUpdateView> {
  String updatedata = "";
  void dataUpdate() async {
    UserController userController = UserController();
    late http.Response response;

    switch (widget.text) {
      case "Kullanıcı Adı":
        response =
            await userController.updateUserName(widget.userId, updatedata);
        break;
      case "İsim":
        response =
            await userController.updateFirstName(widget.userId, updatedata);
        break;
      case "Soy isim":
        response =
            await userController.updateLastName(widget.userId, updatedata);
        break;
      case "Email":
        response = await userController.updateEmail(widget.userId, updatedata);
        break;
      case "Şifre":
        response =
            await userController.updatePassword(widget.userId, updatedata);
        break;
    }
    if (response.statusCode == 200) {
      print(response.body);
      print("güncellendi");
    } else {
      print("güncellenemedi");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "${widget.whichUpdate} Güncelle",
          style: const TextStyle(
              fontSize: 20,
              color: ColorConstants.whiteColor,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFieldWidget(
          hintText: widget.text,
          onDataChanged: (value) {
            setState(() {
              updatedata = value;
            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
            onPressed: () {
              dataUpdate();
            },
            child: const Text("Güncelle"))
      ],
    );
  }
}
