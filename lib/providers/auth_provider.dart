import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_screen_homework/data/firebase/firebase_service.dart';
import 'package:login_screen_homework/data/models/universal_data.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthProvider with ChangeNotifier {
  AuthProvider({required this.fireBaseServices});

  final FireBaseServices fireBaseServices;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  bool isLoading = false;

  loginButtonPressed() {
    passwordController.clear();
    confirmPasswordController.clear();
    emailController.clear();
    userNameController.clear();
    phoneNumber.clear();
  }

  signUpButtonPressed() {
    passwordController.clear();
    confirmPasswordController.clear();
    emailController.clear();
    userNameController.clear();
    phoneNumber.clear();
  }

  Future<void> signUpUser(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    signUpButtonPressed();
    isLoading = true;
    notifyListeners();
    UniversalData universalData =
        await fireBaseServices.signUpUser(email: email, password: password);
    isLoading = false;
    notifyListeners();
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        manageMessage(context, 'Successfully Loged in!');
      }
    } else {
      if (context.mounted) {
        manageMessage(context, universalData.error);
      }
    }

    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      manageMessage(context, e.code);
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> logIn(BuildContext context) async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String phoneNumber = confirmPasswordController.text;
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = false;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      manageMessage(context, e.code);
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.signOut();
      isLoading = false;
      loginButtonPressed();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      manageMessage(context, e.code);
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }

  manageMessage(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    isLoading = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      isLoading = true;
      notifyListeners();

      await FirebaseAuth.instance.signInWithCredential(credential);
      isLoading = false;
      loginButtonPressed();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      manageMessage(context, e.code);
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (error) {
      manageMessage(context, error.toString());
    }
  }



  Future<UserCredential> signInWithFacebook(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }




  String generateNonce([int length = 32]) {
    final charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple(BuildContext context) async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }

}
