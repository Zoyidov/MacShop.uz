import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/screens/widgets/log_out.dart';
import 'package:provider/provider.dart';

import '../../providers/profile_provider.dart';
import '../../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Profile', style: TextStyle(color: AppColors.white)),
        actions: [
          IconButton(
            onPressed: () => showLogoutDialog(context),
            icon: Icon(
              Icons.logout,
              size: 30,
            ),
            color: AppColors.white,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 70,
              child: ClipOval(
                child: Image.network(
                  user?.photoURL ?? "",
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildUserInfo(Icon(Icons.email), user?.email ?? 'Empty'),
            _buildUserInfo(Icon(Icons.person), user?.displayName ?? 'Empty'),
            _buildUserInfo(Icon(Icons.phone), user?.phoneNumber ?? 'Empty'),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo(Icon icon, String value) {
    return Center(
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
    );
  }
}
