// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:abc/feature/login/sign_up_view.dart';
import 'package:abc/product/api/controllers/concrete/user_controller.dart';
import 'package:abc/product/localdb/controllers/concrete/user_localdb.dart';
import 'package:abc/product/widgets/app_title_widget.dart';
import 'package:abc/product/widgets/button_widget.dart';
import 'package:abc/product/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../product/models/post_model.dart';
import '../../product/constants/color_constants.dart';
import '../../product/constants/string_constants.dart';
import '../../product/localdb/user_model.dart/localdb_user_model.dart';
import '../../tabbar_view.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  final TextEditingController _textEditingControllerUserName =
      TextEditingController();
  final TextEditingController _textEditingControllerPassword =
      TextEditingController();
  UserLocalDb userLocalDb = UserLocalDb();

  void getUser() async {
    LocalDbUserModel? user = await userLocalDb.getUser();
    setState(() {
      if (isEmailAuth) {
        userOrEmail = user?.email ?? "";
        _textEditingControllerUserName.text = user?.email ?? "";
      } else {
        userOrEmail = user?.username ?? "";
        _textEditingControllerUserName.text = user?.username ?? "";
      }
      pass = user?.password ?? "";
    });

    _textEditingControllerPassword.text = user?.password ?? "";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    _textEditingControllerUserName.dispose();
    _textEditingControllerPassword.dispose();
    super.dispose();
  }

  String? userOrEmail;
  String? pass;
  late bool sifregizle = true;
  bool isEmailAuth = false;
  bool isLoading = false;
  bool isNull = false;

  void userLogin(String userOrEmail, String password) async {
    setState(() {
      isLoading = true;
    });
    final http.Response response;
    UserController userContoroller = UserController();
    try {
      if (isEmailAuth) {
        response =
            await userContoroller.emailorPasswordCheck(userOrEmail, password);
      } else {
        response = await userContoroller.usernameOrPasswordCheck(
            userOrEmail, password);
      }

      if (response.statusCode == 200) {
        setState(() {
          isLoading = false;
        });
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TabBarViewAbc(),
              settings: RouteSettings(
                arguments: {"user": User.fromJson(json.decode(response.body))},
              ),
            ));

        // return User.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 500) {
        // ignore: use_build_context_synchronously
        print(response.body);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Hatalı giriş lütfen tekrar deneyiniz.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tamam'),
                ),
              ],
            );
          },
        );
        setState(() {
          isLoading = false;
        });

        // Handle other status codes if needed
      } else {
        setState(() {
          isLoading = false;
        });
        print(response.statusCode);
        print("başarısız");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('API isteği sırasında bir hata oluştu: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }

  bool checkValidation(String? userOrEmail, String? password) {
    if (userOrEmail != null && password != null) {
      setState(() {
        isNull = false;
      });
      return true;
    } else {
      setState(() {
        isNull = true;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"signup": (context) => SignUpView()},
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorConstants.blackColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _appTitle,
              isNull
                  ? Text(
                      isEmailAuth
                          ? StringConstants.nullisEmailAuthTrue
                          : StringConstants.nullisEmailAuthFalse,
                      style: TextStyle(color: ColorConstants.errorRed),
                    )
                  : Container(),
              SizedBox(height: 16),
              _textFormKullAdi,
              SizedBox(height: 16),
              _textFormSifre,
              SizedBox(height: 24),
              _loginButton,
              SizedBox(height: 16),
              _info,
              SizedBox(height: 36),
              _orText,
              SizedBox(height: 32),
              _emailButton,
              SizedBox(height: 24),
              _googleButton,
              SizedBox(height: 24),
              _signUpButton
            ],
          )),
    );
  }

  Widget get _appTitle => AppTitleWidget(app_title: StringConstants.appName);

  Widget get _textFormKullAdi => TextFieldWidget(
      controller: _textEditingControllerUserName,
      onDataChanged: (text) {
        setState(() {
          userOrEmail = text;
        });
      },
      hintText: isEmailAuth
          ? StringConstants.isEmailAuthTruePlaceHolder
          : StringConstants.isEmailAuthFalsePlaceHolder);

  Widget get _textFormSifre => TextFieldWidget(
      controller: _textEditingControllerPassword,
      sifregizle: sifregizle,
      iconButton: IconButton(
        onPressed: () {
          setState(() {
            sifregizle = !sifregizle;
          });
        },
        icon: sifregizle
            ? Icon(Icons.visibility_off)
            : Icon(Icons.remove_red_eye),
        color: Colors.grey,
      ),
      onDataChanged: (text) {
        setState(() {
          pass = text;
        });
      },
      hintText: "Şifre");

  Widget get _loginButton => ButtonWidget(
      onPressed: () {
        if (checkValidation(userOrEmail, pass)) {
          isLoading ? null : userLogin(userOrEmail!, pass!);
        } else {
          null;
        }
      },
      child: isLoading ? CircularProgressIndicator() : Text("Giriş Yap"));

  Widget get _info => SizedBox(
        width: 380,
        child: Text(
          textAlign: TextAlign.center,
          "verilerinizi felan çalıyoruz hiçbiri güvende değil haberiniz olsun",
          style: TextStyle(
            color: ColorConstants.greyColor,
          ),
        ),
      );

  Widget get _orText => Row(
        children: [
          _orTextLine,
          Text(
            "veya",
            style: TextStyle(color: ColorConstants.greyColor),
          ),
          _orTextLine
        ],
      );

  Widget get _orTextLine => Container(
        width: 158,
        height: 0.2,
        color: Colors.grey,
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      );

  Widget get _emailButton => ButtonWidget.Icon(Icon(Icons.person_2_outlined),
      Text("Anonim Olarak Giriş Yap"), Colors.transparent, null,
      borderSide: BorderSide(
          style: BorderStyle.solid, color: ColorConstants.whiteColor));

  Widget get _googleButton => ButtonWidget.Icon(
          Icon(Icons.abc, color: ColorConstants.blackColor),
          Text(
              isEmailAuth
                  ? StringConstants.isEmailAuthTrue
                  : StringConstants.isEmailAuthFalse,
              style: TextStyle(color: Colors.black)),
          Colors.white, () {
        setState(() {
          isEmailAuth = !isEmailAuth;
        });
        getUser();
      });

  Widget get _signUpButton => ButtonWidget.Icon(
        Icon(Icons.person_add_alt_1_outlined),
        Text(
          "Yeni Hesap Oluştur",
          style: TextStyle(color: ColorConstants.whiteColor),
        ),
        ColorConstants.blueColor,
        () {
          Navigator.pushNamed(context, 'signup');
        },
      );
}
