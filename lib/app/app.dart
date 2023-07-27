import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/login_screen/login_screen.dart';
import 'package:login_screen_homework/ui/tab_box/tab_box.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthProvider>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return LoginPage();
          } else {
            return TabBoxScreen();
          }
        },
      ),
    );
  }
}