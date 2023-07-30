import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ProfileProvider with ChangeNotifier {

  ProfileProvider(){
    currentUser = FirebaseAuth.instance.currentUser;
    notifyListeners();
    listenUserChanges();
  }

  bool isLoading = false;
  User? currentUser;

  notify(bool value){
    isLoading = value;
    notifyListeners();
  }

  showMessage(BuildContext context, String error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading = false;
    notifyListeners();
  }


  listenUserChanges(){
    FirebaseAuth.instance.userChanges().listen((User? user) {
      currentUser = user;
      notifyListeners();
    });
  }


}