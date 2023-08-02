import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../ui/tab_box_admin/tab_box_admin.dart';
import '../ui/tab_box_client/tab_box_client.dart';
import '../utils/constants.dart';

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
            return snapshot.data!.email == adminEmail
                ? TabBoxAdmin()
                : TabBoxScreen();
          }
        },
      ),
    );
  }
}