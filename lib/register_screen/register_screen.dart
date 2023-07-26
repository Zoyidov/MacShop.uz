import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_screen_homework/widgets/circle.dart';
import 'package:login_screen_homework/widgets/global_button.dart';
import '../widgets/global_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -30, right: -15, child: Circles(color: Colors.deepPurple)),
          Positioned(
              top: 530, left: -40, child: Circles(color: Colors.deepPurple)),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text('Create An Account',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30)),
                  SizedBox(height: 80),
                  GlobalTextField(
                      hintText: 'Full Name',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: CupertinoIcons.person_alt,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      hintText: 'Email Adress',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.email,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.lock_rounded,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.lock_rounded,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Icons.call,
                      caption: ''),
                  SizedBox(height: 120),
                  GlobalButton(color: Colors.deepPurple, text: 'Confirm'),
                  SizedBox(height: 50),
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