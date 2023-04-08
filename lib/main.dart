import 'package:abc/Login/log_in_view.dart';
import 'package:abc/screens/chats_screen.dart';
import 'package:abc/screens/profile_screen.dart';

import 'package:flutter/material.dart';

import 'Login/sign_up_view.dart';
import '/tabBar_view.dart';

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
        "profile": (context) => ProfileView(),
        "signup": (context) => const SignUpView(),
        "chats": (context) => const ChatsView(),
      },
      home: const Scaffold(resizeToAvoidBottomInset: false, body: LogInView()),
    );
  }
}
