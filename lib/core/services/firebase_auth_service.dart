import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
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
      if (e.code == 'weak-password') {
        throw CustomException(message: 'weak_password'.tr());
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'email_in_use'.tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'network_error'.tr());
      } else {
        throw CustomException(
            message: 'unexpected_error'.tr());
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.createUserWithEmailAndPassword ${e.toString()} ');
      throw CustomException(
          message: 'unexpected_error'.tr());
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
            message: "invalid_credentials".tr());
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: "invalid_credentials".tr());
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: "invalid_credentials".tr());
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'network_error'.tr());
      } else {
        throw CustomException(
            message: 'unexpected_error'.tr());
      }
    } catch (e) {
      log('Exception in FirebaseAuthService.signInWithEmailAndPassword ${e.toString()} ');
      throw CustomException(
          message: 'unexpected_error'.tr());
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        throw CustomException(message: 'cancelled_by_user'.tr());
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
      throw CustomException(message: e.message ?? "authentication_failed".tr());
    } catch (e) {
      log('SignInWithGoogle Error: ${e.toString()}');
      throw CustomException(message: "unexpected_error".tr());
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
        throw CustomException(message: "facebook_login_failed".tr());
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
      throw CustomException(message: e.message ?? "authentication_failed".tr());
    } catch (e) {
      log('SignInWithFacebook Error: ${e.toString()}');
      throw CustomException(message: "unexpected_error".tr());
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

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
  bool isUserLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
