import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../providers/auth_provider.dart';
import '../../utils/colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Profile',style: TextStyle(color: AppColors.white)),
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          Center(
            child: ZoomTapAnimation(
                onTap: (){context.read<AuthProvider>().logOut(context);},
                child: Text('Log Out',style: TextStyle(color: Colors.black),)),
          )
        ],
      ),
    );
  }
}
