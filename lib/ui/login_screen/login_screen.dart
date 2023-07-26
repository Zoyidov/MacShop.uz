import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:login_screen_homework/utils/images.dart';
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
              top: -30, right: -13, child: Circles(color: AppColors.purple)),
          Positioned(
              top: 500, left: -40, child: Circles(color: AppColors.purple)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  Text('TEXNO  BAZAR',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: AppColors.purple)),
                  Lottie.asset(AppImages.account, height: 300),
                  GlobalTextField(
                      hintText: 'Email Address',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.email,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Icons.key,
                      caption: ''),
                  SizedBox(height: 20),
                  Text('Forgot your password ?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey)),
                  SizedBox(height: 70),
                  GlobalButton(color: AppColors.purple, text: 'Login'),
                  SizedBox(height: 30),
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
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));},
                        child: Text(
                          'CREATE',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
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
