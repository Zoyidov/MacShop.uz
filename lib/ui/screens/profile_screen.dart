import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/screens/widgets/log_out.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../providers/profile_provider.dart';
import '../../utils/colors.dart';
import '../widgets/global_button.dart';
import 'edit_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = context.read<ProfileProvider>().currentUser;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: AppColors.white)),
        actions: [
          ZoomTapAnimation(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAccount()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Text('Edit',style: TextStyle(color: Colors.grey),)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 70,
              child: ClipOval(
                child: user?.photoURL != null?
                Image.network(
                  user?.photoURL ?? '',
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                ):
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 70,
                  child: Icon(CupertinoIcons.person_alt,size: 100,color: AppColors.white,),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildUserInfo(Icon(Icons.email), user?.email ?? 'Empty'),
            const SizedBox(height: 20),
            _buildUserInfo(Icon(Icons.person), user?.displayName ?? '******'),
            const SizedBox(height: 20),
            _buildUserInfo(Icon(Icons.phone), user?.phoneNumber ?? '+998 __ ___ __ __'),
            SizedBox(height: 100),
            GlobalButton(color: AppColors.black, text: 'Log Out', onTap: () => showLogoutDialog(context), tcolor: Colors.red)
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(Icon icon, String value) {
    return Center(
      child: Container(

        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset.zero,
            ),
          ],
        ),
        child: Row(
          children: [
            icon,
            Text(
              ' $value',
              style: const TextStyle(
                fontSize: 20,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
