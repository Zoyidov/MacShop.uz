import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/screens/widgets/log_out.dart';
import 'package:login_screen_homework/ui/widgets/global_button.dart';
import 'package:login_screen_homework/ui/widgets/global_textfield.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../providers/auth_provider.dart';
import '../../providers/profile_provider.dart';
import '../../utils/colors.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: ZoomTapAnimation(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              )),
        ),
        actions: [
          ZoomTapAnimation(
            onTap: (){
              context.read<ProfileProvider>().updateEmail(context);
              context.read<ProfileProvider>().updateUsername(context);
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.grey),
                )),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 70,
              child: ClipOval(
                child: user?.photoURL != null
                    ? Image.network(
                        user?.photoURL ?? '',
                        fit: BoxFit.cover,
                        width: 130,
                        height: 130,
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 70,
                        child: Icon(
                          CupertinoIcons.person_alt,
                          size: 100,
                          color: AppColors.white,
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                GlobalTextField(
                  hintText: '',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.email,
                  caption: '',
                  controller: context.read<ProfileProvider>().emailController,
                ),
                SizedBox(height: 20),
                GlobalTextField(
                  hintText: '',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.person,
                  caption: '',
                  controller: context.read<ProfileProvider>().nameController,
                ),
                SizedBox(height: 20),
                GlobalTextField(
                  hintText: '',
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  prefixIcon: Icons.phone,
                  caption: '',
                  controller: context.read<ProfileProvider>().phoneController,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
