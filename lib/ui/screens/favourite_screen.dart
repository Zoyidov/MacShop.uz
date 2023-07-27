import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Favourites',style: TextStyle(color: AppColors.white)),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
