import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../widgets/circle.dart';
import '../widgets/global_button.dart';
import '../widgets/global_textfield.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -30, right: -13, child: Circles(color: AppColors.black)),
          Positioned(
              top: 530, left: -40, child: Circles(color: AppColors.black)),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Text('Create An Account',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30)),
                  SizedBox(height: 80),
                  GlobalTextField(
                      controller: context.read<AuthProvider>().userNameController,
                      hintText: 'Full Name',
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      prefixIcon: CupertinoIcons.person_alt,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      controller: context.read<AuthProvider>().emailController,
                      hintText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.email,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      controller: context.read<AuthProvider>().passwordController,
                      hintText: 'Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.lock_rounded,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      controller: context.read<AuthProvider>().confirmPasswordController,
                      hintText: 'Confirm Password',
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: Icons.lock_rounded,
                      caption: ''),
                  SizedBox(height: 20),
                  GlobalTextField(
                      controller: context.read<AuthProvider>().phoneNumber,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      prefixIcon: Icons.call,
                      caption: ''),
                  SizedBox(height: 100),
                  GlobalButton(color: AppColors.black, text: 'Confirm', onTap: () {
                    context.read<AuthProvider>().signUpUser(context);
                   }, tcolor: AppColors.white),
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