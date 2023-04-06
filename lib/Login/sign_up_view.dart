// kayıt ol

// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _appTitle,
            _textform_name,
            SizedBox(height: 16),
            _textform_kullAdi,
            SizedBox(height: 16),
            _textForm_sifre,
            SizedBox(height: 24),
            _textForm_sifreTekrar,
            SizedBox(height: 24),
            _LoginButton,
            SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: Text(
                'Zaten bir hesabın var mı? \n Giriş Yap',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Widget get _appTitle => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(0, 80, 0, 48),
        child: Text("ABC DEF",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins', // çalışmıyor !
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.normal)),
      );

  Widget get _textform_kullAdi => Center(
        child: Container(
          height: 44,
          width: 380,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              filled: true,
              //focusedBorder: outlineInputBorder,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "kullanıcı Adı",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ),
      );

  Widget get _textform_name => Center(
        child: Container(
          height: 44,
          width: 380,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              filled: true,
              //focusedBorder: outlineInputBorder,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "isim",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ),
      );

  Widget get _textForm_sifre => Center(
        child: SizedBox(
          height: 44,
          width: 380,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            maxLines: 1,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              filled: true,
              //focusedBorder: outlineInputBorder,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "Şifre",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ),
      );

  Widget get _textForm_sifreTekrar => Center(
        child: SizedBox(
          height: 44,
          width: 380,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            maxLines: 1,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_red_eye),
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
              filled: true,
              //focusedBorder: outlineInputBorder,
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              enabledBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              hintText: "tekrar sifre",
              hintStyle: TextStyle(color: Colors.grey),
              fillColor: Color.fromRGBO(60, 60, 67, 0.6),
            ),
          ),
        ),
      );

  Widget get _LoginButton => SizedBox(
        width: 380,
        height: 44,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {},
          child: Text('Kaydol'),
        ),
      );
}
