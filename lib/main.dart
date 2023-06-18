import 'package:abc/feature/login/log_in_view.dart';
import 'package:abc/feature/screens/chats_screen.dart';
import 'package:abc/feature/screens/profile_screen.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'feature/login/sign_up_view.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
