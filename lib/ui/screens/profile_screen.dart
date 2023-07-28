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
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Profile',style: TextStyle(color: AppColors.white)),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    title: const Text('Are you sure?', style: TextStyle(color: Colors.white)),
                    actions: [
                      TextButton(
                        child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Log out', style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          context.read<AuthProvider>().logOut(context);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.logout, size: 30,),
            color: AppColors.white,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.black),
            ),
          ),
          SizedBox(height: 200),

        ],
      ),
    );
  }
}
