import 'package:abc/Login/log_in_view.dart';

import 'package:flutter/material.dart';

import 'Login/sign_up_view.dart';
import 'home/tabBar_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "login": (context) => const LogInView(),
        "signup": (context) => const SignUpView()
      },
      home: Scaffold(resizeToAvoidBottomInset: false, body: LogInView()),
    );
  }
}
