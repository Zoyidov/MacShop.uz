import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/register_screen/register_screen.dart';
import 'package:login_screen_homework/widgets/circle.dart';
import 'package:login_screen_homework/widgets/global_button.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../widgets/global_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -30, right: -15, child: Circles(color: Colors.deepPurple)),
          Positioned(
              top: 500, left: -40, child: Circles(color: Colors.deepPurple)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Lottie.asset('assets/images/account.json', height: 300),
                  GlobalTextField(
                      hintText: 'Name',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: CupertinoIcons.person_alt,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      hintText: 'Name',
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
                  SizedBox(height: 100),
                  GlobalButton(color: Colors.deepPurple, text: 'Login'),
                  SizedBox(height: 30),
                  ZoomTapAnimation(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));},
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(text: "Don’t have an account? "),
                          TextSpan(
                            text: 'CREATE',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}