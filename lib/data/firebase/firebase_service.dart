import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_screen_homework/data/models/universal_data.dart';

class FireBaseServices{

  Future<UniversalData > signUpUser({
    required String email,
    required String password,

}) async {
    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return UniversalData(data: userCredential);

    } on FirebaseAuthException catch (e) {
      return UniversalData(error: e.code);

    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

}