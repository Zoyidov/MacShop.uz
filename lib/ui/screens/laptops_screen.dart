import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class LaptopsScreen extends StatelessWidget {
  const LaptopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('MacBooks',style: TextStyle(color: AppColors.white)),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
