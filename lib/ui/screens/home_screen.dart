import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home',style: TextStyle(color: AppColors.white)),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
