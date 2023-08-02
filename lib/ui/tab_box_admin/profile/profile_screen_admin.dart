import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/widgets/global_button.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/profile_provider.dart';
import '../../screens/widgets/log_out.dart';
import '../../widgets/global_textfield.dart';

class ProfileScreenAdmin extends StatefulWidget {
  const ProfileScreenAdmin({super.key});

  @override
  State<ProfileScreenAdmin> createState() => _ProfileScreenAdminState();
}

class _ProfileScreenAdminState extends State<ProfileScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<ProfileProvider>().currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Profile"),
        actions: [
          IconButton(
          onPressed: () => showLogoutDialog(context), color: Colors.red,
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Image.network(
                user?.photoURL ?? "",
                width: 100,
                height: 100,
              ),
              const SizedBox(height: 50),
              GlobalTextField(
                hintText: "${user?.displayName}",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: context.read<ProfileProvider>().nameController,
                prefixIcon: Icons.admin_panel_settings,
                caption: '',
              ),
              SizedBox(height: 20),
              GlobalTextField(
                hintText: "${user?.email}",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                controller: context.read<ProfileProvider>().emailController,
                prefixIcon: Icons.email,
                caption: '',
              ),
              SizedBox(height: 50),
              GlobalButton(
                  color: Colors.black,
                  tcolor: Colors.white,
                  text: 'Update',
                  onTap: () {
                    context.read<ProfileProvider>().updateUsername(context);
                    context.read<ProfileProvider>().updateEmail(context);
                    context.read<ProfileProvider>().updateUserImage(context,
                        "https://cdn-icons-png.flaticon.com/512/3135/3135715.png");

                  })
            ],
          ),

        ),
      ),
    );
  }
}