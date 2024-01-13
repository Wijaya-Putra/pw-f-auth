import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pw_auth/pages/home_page.dart';
import 'package:pw_auth/pages/login_page.dart';

import 'login_or_register_page.dart';

class AtuhPage extends StatelessWidget {
  const AtuhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User Logged in
          if (snapshot.hasData) {
            return HomePage();
          }

          // User not Logged in
          else {
            return LoginorRegisterPage();
          }
        },
      ),
    );
  }
}
