import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../errors/exceptions.dart';
import 'dart:convert';
import 'dart:math' as math;

import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
        throw CustomException(message: 'تأكد من الاتصال بالانترنت.');
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
        throw CustomException(
            message: 'كلمةالمرور أو البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'كلمةالمرور أو البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'كلمةالمرور أو البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تأكد من الاتصال بالانترنت.');
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
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw CustomException(message: 'Sign in was cancelled by user.');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return (await FirebaseAuth.instance.signInWithCredential(credential))
          .user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} ${e.message}');
      throw CustomException(message: e.message ?? 'Authentication failed.');
    } catch (e) {
      log('SignInWithGoogle Error: ${e.toString()}');
      throw CustomException(message: 'An unexpected error occurred.');
    }
  }

  Future<User> signInWithFacebook() async {
    try {
      // Generate nonce for iOS (rawNonce for Apple Sign-In-like flow)
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Perform Facebook login and retrieve access token
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Check login status
      if (loginResult.status != LoginStatus.success) {
        throw CustomException(message: 'Facebook login failed.');
      }

      // Get the access token
      final String accessToken = loginResult.accessToken!.tokenString;

      // Create OAuth credential
      OAuthCredential facebookAuthCredential;

      // Handle iOS-specific flow
      if (Platform.isIOS) {
        facebookAuthCredential = OAuthCredential(
          providerId: 'facebook.com',
          signInMethod: 'oauth',
          accessToken: accessToken,
          rawNonce: nonce,
        );
      } else {
        // For Android or other platforms, use default credential
        facebookAuthCredential = FacebookAuthProvider.credential(accessToken);
      }

      // Sign in to Firebase with the Facebook credential
      final UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      throw CustomException(message: e.message ?? 'Authentication failed.');
    } catch (e) {
      log('SignInWithFacebook Error: ${e.toString()}');
      throw CustomException(message: 'An unexpected error occurred.');
    }
  }

  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<User> signInWithApple() async {
    // To prevent replay attacks with the credential returned from Apple, we
    // include a nonce in the credential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    return (await FirebaseAuth.instance.signInWithCredential(oauthCredential))
        .user!;
  }
}
