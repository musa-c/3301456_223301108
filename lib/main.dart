import 'package:abc/Login/log_in_view.dart';
import 'package:flutter/material.dart';

import 'Login/sign_up_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: LogInView(),
        ),
      ),
    );
  }
}
