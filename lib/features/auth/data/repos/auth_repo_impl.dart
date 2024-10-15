import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/exceptions.dart';
import 'package:fruits/core/services/firebase_auth_service.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(
          ServerFailure(message: 'An error occurred while creating the user'));
    }
  }
}
