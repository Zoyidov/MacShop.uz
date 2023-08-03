import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_screen_homework/data/firebase/prodycts_service.dart';
import 'package:login_screen_homework/providers/auth_provider.dart';
import 'package:login_screen_homework/providers/category_provider.dart';
import 'package:login_screen_homework/providers/order_provider.dart';
import 'package:login_screen_homework/providers/products_provider.dart';
import 'package:login_screen_homework/providers/profiles_provider.dart';
import 'package:login_screen_homework/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'data/firebase/auth_service.dart';
import 'data/firebase/category_service.dart';
import 'data/firebase/orders_service.dart';
import 'data/firebase/profile_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(firebaseServices: AuthService()),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              ProfileProvider(profileService: ProfileService()),
          lazy: true,
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
          create: (context) => OrderProvider(orderService: OrderService()),
          lazy: false,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          theme: ThemeData.dark(),
        );
      },
      child: SplashScreen(),
    );
  }
}
