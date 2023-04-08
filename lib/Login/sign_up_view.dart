// kayıt ol

// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abc/widgets/app_title_widget.dart';
import 'package:abc/widgets/button_widget.dart';
import 'package:abc/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _appTitle,
            _textFormName,
            SizedBox(height: 16),
            _textFormKullAdi,
            SizedBox(height: 16),
            _textFormSifre,
            SizedBox(height: 24),
            _textFormSifreTekrar,
            SizedBox(height: 24),
            _loginButton,
            SizedBox(height: 24),
            _textButton,
          ],
        ));
  }

  Widget get _appTitle => AppTitleWidget(app_title: "fsociety");
  Widget get _textFormName => TextFieldWidget(hintText: "İsim");
  Widget get _textFormKullAdi => TextFieldWidget(hintText: "Kullanıcı Adı");

  Widget get _textFormSifre => TextFieldWidget(
      hintText: "Şifre",
      iconButton: IconButton(
        onPressed: () {},
        icon: Icon(Icons.remove_red_eye),
        color: Colors.grey,
      ));

  Widget get _textFormSifreTekrar => TextFieldWidget(
      hintText: "Tekrar Şifre",
      iconButton: IconButton(
        onPressed: () {},
        icon: Icon(Icons.remove_red_eye),
        color: Colors.grey,
      ));

  Widget get _loginButton =>
      ButtonWidget(onPressed: () {}, child: Text("Kaydol"));

  Widget get _textButton => ButtonWidget.textBtn(
        () {
          Navigator.pushNamed(context, 'login');
        },
        Text(
          'Zaten bir hesabın var mı? \n Giriş Yap',
          textAlign: TextAlign.center,
        ),
      );
}
