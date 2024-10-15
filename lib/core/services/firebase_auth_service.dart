

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'An error occurred, please try again later.');
      }
    } catch (e) {
      throw CustomException(
          message: 'An error occurred while creating the user.');
    }
  }
}
