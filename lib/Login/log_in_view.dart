// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _appTitle,
            _textform_kullAdi,
            SizedBox(height: 16),
            _textForm_sifre,
            SizedBox(height: 24),
            _LoginButton,
            SizedBox(height: 16),
            _Info,
            SizedBox(height: 36),
            _orText,
            SizedBox(height: 32),
            _EmailButton,
            SizedBox(height: 24),
            _GoogleButton,
            SizedBox(height: 24),
            _SignUpButton
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

  Widget get _LoginButton => SizedBox(
        width: 380,
        height: 44,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {},
          child: Text('Giriş Yap'),
        ),
      );

  Widget get _Info => SizedBox(
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
          Container(
            width: 158,
            height: 0.2,
            color: Colors.grey,
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
          ),
          Text(
            "veya",
            style: TextStyle(color: Colors.grey),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
            width: 158,
            height: 0.2,
            color: Colors.grey,
          )
        ],
      );

  Widget get _EmailButton => SizedBox(
        width: 380,
        height: 44,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.person_2_outlined),
          label: Text("Anonim Olarak Giriş Yap"),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                      style: BorderStyle.solid, color: Colors.white))),
        ),
      );

  Widget get _GoogleButton => SizedBox(
        width: 380,
        height: 44,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.access_time_sharp,
            color: Colors.black,
          ),
          label: Text(
            "Email ile Giriş Yap",
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
        ),
      );

  Widget get _SignUpButton => SizedBox(
        width: 380,
        height: 44,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.person_add_alt_1_outlined),
          label: Text(
            "Yeni Hesap Oluştur",
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
        ),
      );
}
