import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ddd/domain/auth/user.dart' as UserModel;
import 'package:flutter_ddd/domain/auth/value_objects.dart';

extension FirebaseUserDomainX on User {
  UserModel.User toDomain() {
    return UserModel.User(id: UniqueId.fromUniqueString(uid));
  }
}
