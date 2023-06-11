// kayıt ol

// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:abc/widgets/app_title_widget.dart';
import 'package:abc/widgets/button_widget.dart';
import 'package:abc/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  String? userName;
  String? email;
  String? password;
  bool isDataAdded = false;
  bool isLoading = false;
  bool isNull = false;
  // Simüle edilmiş bir post işlemi

  bool checkValidation(String? userName, String? email, String? password) {
    if (userName != null && email != null && password != null) {
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

  void showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Başarılı'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(height: 16),
              Text('Hesap oluşturuldu.'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }

  void createUser(String userName, String email, String password) async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:26342/api/users/createUser'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'UserName': userName,
          'Email': email,
          'Password': password,
        }),
      );

      if (response.statusCode == 201) {
        setState(() {
          isLoading = false;
          isDataAdded = true;
        });

        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            isLoading = false;
            showModal(context);
          });
        });

        // return User.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 500) {
        // ignore: use_build_context_synchronously
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text(
                  'e mail veya kullanıcı adı zaten kullanılıyor lütfen değiştirin.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _appTitle,
            isNull
                ? Text(
                    "Lütfen alanların hepsini doldurunuz.",
                    style: TextStyle(color: Colors.red),
                  )
                : Container(),
            SizedBox(height: 16),
            _textFormName,
            SizedBox(height: 16),
            _textFormKullAdi,
            SizedBox(height: 16),
            _textFormEmail,
            SizedBox(height: 16),
            _textFormSifre,
            SizedBox(height: 24),
            _loginButton,
            SizedBox(height: 24),
            _textButton,
          ],
        ));
  }

  Widget get _appTitle => AppTitleWidget(app_title: "PAYLAP");
  Widget get _textFormName => TextFieldWidget(hintText: "İsim");
  Widget get _textFormKullAdi => TextFieldWidget(
      hintText: "Kullanıcı Adı",
      onDataChanged: (value) => setState(() {
            userName = value;
          }));
  Widget get _textFormEmail => TextFieldWidget(
      hintText: "Email",
      onDataChanged: (value) => setState(() {
            email = value;
          }));

  Widget get _textFormSifre => TextFieldWidget(
      hintText: "Şifre",
      onDataChanged: (value) => setState(() {
            password = value;
          }),
      iconButton: IconButton(
        onPressed: () {},
        icon: Icon(Icons.remove_red_eye),
        color: Colors.grey,
      ));

  Widget get _loginButton => ButtonWidget(
      onPressed: () {
        if (checkValidation(userName, email, password)) {
          isLoading ? null : createUser(userName!, email!, password!);
        } else {
          null;
        }
      },
      child: isLoading ? CircularProgressIndicator() : Text("Kaydol"));

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
