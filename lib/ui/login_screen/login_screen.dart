import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/providers/auth_provider.dart';
import 'package:login_screen_homework/ui/widgets/login_by.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';
import 'package:provider/provider.dart';
import '../widgets/circle.dart';
import '../widgets/global_button.dart';
import '../widgets/global_textfield.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../register_screen/register_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -30, right: -13, child: Circles(color: AppColors.black)),
          Positioned(
              top: 500, left: -40, child: Circles(color: AppColors.black)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Text('MacShop',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: AppColors.black)),
                  Lottie.asset(AppImages.account, height: 300),
                  GlobalTextField(
                      controller: context.read<AuthProvider>().emailController,
                      hintText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.email,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      controller:
                          context.read<AuthProvider>().passwordController,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Icons.key,
                      caption: ''),
                  SizedBox(height: 50),
                  LoginBy(),
                  SizedBox(height: 50),
                  GlobalButton(
                      color: AppColors.black,
                      text: 'Login',
                      onTap: () {
                        context.read<AuthProvider>().logIn(context);
                      },
                      tcolor: AppColors.white),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                      ZoomTapAnimation(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                          context.read<AuthProvider>().loginButtonPressed();
                        },
                        child: Text(
                          'CREATE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }
}
