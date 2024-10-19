import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/backend_endpoints.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
     await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      await deleteUser(user);
      log('Exception in createUserWithEmailAndPassword ${e.toString()} ');
      return left(ServerFailure(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقا 3ً'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);

      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      log('Exception in signInWithEmailAndPassword ${e.toString()} ');
      return left(ServerFailure(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
       user = await firebaseAuthService.signInWithGoogle();

      var userEntity =UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
     await deleteUser(user);
      log('Exception in signInWithGoogle ${e.toString()} ');
      return left(ServerFailure(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
       user = await firebaseAuthService.signInWithFacebook();
      var userEntity =UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithGoogle ${e.toString()} ');
      return left(ServerFailure(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User ? user;
    try {
       user = await firebaseAuthService.signInWithApple();
      var userEntity =UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in signInWithGoogle ${e.toString()} ');
      return left(ServerFailure(
          message: 'لقد حدث خطأ غير متوقع. الرجاء المحاولة لاحقاً .'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
    );
  }
}
