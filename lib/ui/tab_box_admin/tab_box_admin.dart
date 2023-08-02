import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/tab_box_admin/products/products_screen_admin.dart';
import 'package:login_screen_homework/ui/tab_box_admin/products/sub_screens/product_add_screen.dart';
import 'package:login_screen_homework/ui/tab_box_admin/profile/profile_screen_admin.dart';


import '../../utils/colors.dart';
import 'categories/categories_screen_admin.dart';
import 'categories/sub_screens/category_add_screen.dart';

class TabBoxAdmin extends StatefulWidget {
  const TabBoxAdmin({Key? key});

  @override
  State<TabBoxAdmin> createState() => _TabBoxAdminState();
}

class _TabBoxAdminState extends State<TabBoxAdmin> {
  List<Widget> screens = [];

  int currentIndex = 0;

  @override
  void initState() {
    screens = [
      ProductsScreenAdmin(),
      CategoriesScreenAdmin(),
      ProfileScreenAdmin(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: AppColors.black,
        buttonBackgroundColor: AppColors.black,
        height: 75,
        items: const <Widget>[
          Icon(Icons.device_hub, size: 30, color: AppColors.white),
          Icon(Icons.apple, size: 30, color: AppColors.white),
          Icon(Icons.person, size: 30, color: AppColors.white),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: currentIndex == 1
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CategoryAddScreen();
              },
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      )
          : currentIndex == 0
          ? FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ProductAddScreen();
              },
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      )
          : null,
    );
  }
}
