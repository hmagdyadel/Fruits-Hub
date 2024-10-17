

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService ${e.toString()} ');
      if (e.code == 'الكلمة المرور ضعيفة') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'تأكد من الاتصال بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword ${e.toString()} ');
      throw CustomException(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً 2.');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('Exception in FirebaseAuthService ${e.toString()} ');
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'كلمةالمرور أو البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمةالمرور أو البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            message: 'تأكد من الاتصال بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .');
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword ${e.toString()} ');
      throw CustomException(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .');
    }
  }


  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
