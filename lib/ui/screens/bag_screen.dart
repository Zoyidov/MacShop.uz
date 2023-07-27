import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/colors.dart';


class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Basket',style: TextStyle(color: AppColors.white)),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
