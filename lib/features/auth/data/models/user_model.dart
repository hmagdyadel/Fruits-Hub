import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uid,
  });

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      email: user.email??'',
      name: user.displayName??'',
      uid: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'],
      name: map['name'],
      uid: map['uid'],
    );
  }
}
