import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../providers/tabsbox.dart';
import '../../utils/colors.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({Key? key}) : super(key: key);

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabBox>(context, listen: true);
    return Scaffold(
      body:provider.widget,
        bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: AppColors.black,
        buttonBackgroundColor: AppColors.black,
        height: 75,
        items: const <Widget>[
          Icon(CupertinoIcons.device_laptop, size: 30,color: AppColors.white),
          Icon(Icons.shopping_bag, size: 30,color: AppColors.white),
          Icon(Icons.home, size: 30,color: AppColors.white),
          Icon(Icons.favorite_border_outlined, size: 30,color: AppColors.white),
          Icon(Icons.person, size: 30,color: AppColors.white),
        ],
        onTap: (index) {
          provider.getScreen(index);
        },
      )
    );
  }
}

