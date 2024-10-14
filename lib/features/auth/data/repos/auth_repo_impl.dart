import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password) async {
    throw UnimplementedError();
  }
}
