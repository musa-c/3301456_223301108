import 'dart:convert';

import 'package:abc/product/api/controllers/concrete/user_controller.dart';
import 'package:abc/product/constants/color_constants.dart';
import 'package:abc/product/localdb/controllers/concrete/user_localdb.dart';
import 'package:abc/product/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../product/localdb/user_model.dart/localdb_user_model.dart';
import '../../product/widgets/text_field_widget.dart';

class UserDataUpdateView extends StatefulWidget {
  final String text;
  final String whichUpdate;
  final int userId;
  void Function(int id)? callbackGetUserById;
  UserDataUpdateView({
    Key? key,
    required this.text,
    required this.whichUpdate,
    required this.userId,
    this.callbackGetUserById,
  }) : super(key: key);

  @override
  State<UserDataUpdateView> createState() => _UserDataUpdateViewState();
}

class _UserDataUpdateViewState extends State<UserDataUpdateView> {
  bool isLoading = false;
  String updatedata = "";

  void dataUpdate() async {
    setState(() {
      isLoading = true;
    });

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
      setState(() {
        isLoading = false;
      });
      widget.callbackGetUserById!(widget.userId);
      if (!kIsWeb) {
        final jsonData = json.decode(response.body);
        final email = jsonData['Email'];
        final password = jsonData['Password'];
        final username = jsonData['UserName'];

        LocalDbUserModel localDbUserModel = LocalDbUserModel(
            email: email, password: password, username: username);
        UserLocalDb userLocalDb = UserLocalDb();
        await userLocalDb.updateUser(localDbUserModel).then((value) => {
              print("localdb güncellendi"),
            });
      }
      Fluttertoast.showToast(
        msg: "${widget.text} Güncellendi!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: ColorConstants.blackColor,
        textColor: ColorConstants.purpleColor,
        webPosition: "center",
        webBgColor: "#808080",
        fontSize: 16.0,
      );
      // print(response.body);
      print("güncellendi");
    } else if (response.statusCode == 500) {
      setState(() {
        isLoading = false;
      });
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Hata'),
            content: Text('${widget.text} zaten kullanılıyor.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Tamam'),
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.statusCode);
      print(response.body);
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
            child: isLoading
                ? const CircularProgressIndicator()
                : const Text("Güncelle"))
      ],
    );
  }
}
