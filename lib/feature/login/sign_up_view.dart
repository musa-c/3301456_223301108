// kayıt ol

// giriş yap

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abc/product/api/controllers/concrete/user_controller.dart';
import 'package:abc/product/localdb/controllers/concrete/user_localdb.dart';
import 'package:abc/product/localdb/user_model.dart/localdb_user_model.dart';
import 'package:abc/product/widgets/app_title_widget.dart';
import 'package:abc/product/widgets/button_widget.dart';
import 'package:abc/product/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
                Navigator.pushNamed(context, 'login');
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
    UserController userController = UserController();

    try {
      final response =
          await userController.createUser(userName, email, password);

      if (response.statusCode == 201) {
        if (!kIsWeb) {
          LocalDbUserModel localDbUserModel = LocalDbUserModel(
              password: password, username: userName, email: email);
          UserLocalDb userLocalDb = UserLocalDb();
          userLocalDb
              .createUser(localDbUserModel)
              .then((value) => {print("başarılı.")});
        }

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
