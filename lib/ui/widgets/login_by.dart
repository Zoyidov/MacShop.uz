import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_screen_homework/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';

class LoginBy extends StatelessWidget {
  const LoginBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ZoomTapAnimation(
          onTap: (){
            context.read<AuthProvider>().signInWithFacebook(context);

          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.black,
            ),
            child: SvgPicture.asset(AppImages.facebook),
          ),
        ),
        ZoomTapAnimation(
          onTap: (){
            context.read<AuthProvider>().signInWithGoogle(context);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
            ),
            child: SvgPicture.asset(AppImages.google),
          ),
        ),
        ZoomTapAnimation(
          onTap: () async {
            final credential = await SignInWithApple.getAppleIDCredential(
              scopes: [
                AppleIDAuthorizationScopes.email,
                AppleIDAuthorizationScopes.fullName,
              ],
            );
            print(credential);
          },
          child: Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.black,
            ),
            child: SvgPicture.asset(AppImages.apple),
          ),
        ),
      ],
    );
  }
}
