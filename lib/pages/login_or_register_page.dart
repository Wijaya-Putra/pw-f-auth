import 'package:flutter/material.dart';
import 'package:pw_auth/pages/login_page.dart';

import 'register_page.dart';

class LoginorRegisterPage extends StatefulWidget {
  const LoginorRegisterPage({super.key});

  @override
  State<LoginorRegisterPage> createState() => _LoginorRegisterPageState();
}

class _LoginorRegisterPageState extends State<LoginorRegisterPage> {
  // Initially show login
  bool showLoginPage = true;

  // toggel ligon or register
  void toggelPage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: toggelPage);
    } else {
      return RegisterPage(
        onTap: toggelPage,
      );
    }
  }
}
