import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/widgets/global_textfield.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../providers/profile_provider.dart';
import '../../utils/colors.dart';

class EditAccount extends StatelessWidget {
  const EditAccount({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: ZoomTapAnimation(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black,fontSize: 18),
              )),
        ),
        leadingWidth: 100,
        actions: [
          ZoomTapAnimation(
            onTap: (){
              context.read<ProfileProvider>().updateEmail(context);
              context.read<ProfileProvider>().updateUsername(context);
              Navigator.pop(context);
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.black,fontSize: 18),
                )),
          ),
        ],
        backgroundColor: Colors.white,
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
                        backgroundColor: Colors.black,
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GlobalTextField(
                    hintText: user?.email ?? '',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.email,
                    caption: '',
                    controller: context.read<ProfileProvider>().emailController,
                  ),
                  SizedBox(height: 20),
                  GlobalTextField(
                    hintText: user?.displayName ?? '',
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIcon: Icons.person,
                    caption: '',
                    controller: context.read<ProfileProvider>().nameController,
                  ),
                  SizedBox(height: 20),
                  GlobalTextField(
                    hintText: user?.phoneNumber ?? '',
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    prefixIcon: Icons.phone,
                    caption: '',
                    controller: context.read<ProfileProvider>().phoneController,
                  ),
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
