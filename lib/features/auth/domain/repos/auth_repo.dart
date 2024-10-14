import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failures.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password);
  
}
