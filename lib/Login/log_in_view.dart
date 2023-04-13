// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abc/Login/sign_up_view.dart';
import 'package:abc/screens/home_screen.dart';
import 'package:abc/widgets/app_title_widget.dart';
import 'package:abc/widgets/button_widget.dart';
import 'package:abc/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../tabbar_view.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  String? username = "";
  String? pass = "";
  late bool sifregizle = true;

  void Control() {
    if ((username!.length > 2) && (pass!.length >= 6)) {
      var data = [];
      data.add(username);
      data.add(pass);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TabBarViewAbc(),
            settings: RouteSettings(
              arguments: data,
            ),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"signup": (context) => SignUpView()},
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _appTitle,
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

  Widget get _appTitle => AppTitleWidget(app_title: "PAYLAP");

  Widget get _textFormKullAdi => TextFieldWidget(
      onDataChanged: (text) {
        setState(() {
          username = text;
        });
      },
      hintText: "Kullanıcı Adı");

  Widget get _textFormSifre => TextFieldWidget(
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

  Widget get _loginButton =>
      ButtonWidget(onPressed: Control, child: Text("Giriş Yap"));

  Widget get _info => SizedBox(
        width: 380,
        child: Text(
          textAlign: TextAlign.center,
          "verilerinizi felan çalıyoruz hiçbiri güvende değil haberiniz olsun",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
      );

  Widget get _orText => Row(
        children: [
          _orTextLine,
          Text(
            "veya",
            style: TextStyle(color: Colors.grey),
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
      borderSide: BorderSide(style: BorderStyle.solid, color: Colors.white));

  Widget get _googleButton => ButtonWidget.Icon(
      Icon(
        Icons.abc,
        color: Colors.black,
      ),
      Text("Email ile Giriş Yap", style: TextStyle(color: Colors.black)),
      Colors.white,
      null);

  Widget get _signUpButton => ButtonWidget.Icon(
        Icon(Icons.person_add_alt_1_outlined),
        Text(
          "Yeni Hesap Oluştur",
          style: TextStyle(color: Colors.white),
        ),
        Colors.blue,
        () {
          Navigator.pushNamed(context, 'signup');
        },
      );
}
