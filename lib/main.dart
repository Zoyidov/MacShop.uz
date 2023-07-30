import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_screen_homework/data/firebase/firebase_service.dart';
import 'package:login_screen_homework/providers/auth_provider.dart';
import 'package:login_screen_homework/providers/profile_provider.dart';
import 'package:login_screen_homework/providers/tabsbox.dart';
import 'package:login_screen_homework/ui/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(fireBaseServices: FireBaseServices()),
        ),
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TabBox(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}