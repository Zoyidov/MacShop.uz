import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/screens/bag_screen.dart';
import 'package:login_screen_homework/ui/screens/favourite_screen.dart';

import '../ui/screens/home_screen.dart';
import '../ui/screens/laptops_screen.dart';
import '../ui/screens/profile_screen.dart';


class TabBox with ChangeNotifier {

  TabBox()  {
    getWidgets();
  }

  int currentIndex = 2;
  List<Widget> screens = [];
  Widget? widget;

  void getWidgets(){
    screens.add(const LaptopsScreen());
    screens.add(const BasketScreen());
    screens.add(const HomeScreen());
    screens.add(const FavouriteScreen());
    screens.add(const ProfileScreen());

    widget = screens[0];
    notifyListeners();
  }

  getScreen(int index){
    widget =  screens[index];
    currentIndex = index;
    notifyListeners();
  }

}