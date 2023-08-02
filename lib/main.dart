import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_screen_homework/data/firebase/firebase_service.dart';
import 'package:login_screen_homework/providers/auth_provider.dart';
import 'package:login_screen_homework/providers/category_provider.dart';
import 'package:login_screen_homework/providers/products_provider.dart';
import 'package:login_screen_homework/providers/profile_provider.dart';
import 'package:login_screen_homework/providers/tabsbox.dart';
import 'package:login_screen_homework/ui/splash_screen/splash_screen.dart';
import 'package:login_screen_homework/ui/tab_box_admin/tab_box_admin.dart';
import 'package:provider/provider.dart';

import 'data/firebase/category_service.dart';
import 'data/firebase/prodycts_service.dart';
import 'data/firebase/profile_service.dart';

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
          create: (context) => ProfileProvider(profileService: ProfileService()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              CategoryProvider(categoryService: CategoryService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ProductsProvider(productsService: ProductsService()),
          lazy: true,
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