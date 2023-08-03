import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text('Are you sure?', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            child: const Text('Cancel', style: TextStyle(color: Colors.white)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Log out', style: TextStyle(color: Colors.red)),
            onPressed: () {
              context.read<AuthProvider>().logOutUser(context);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}