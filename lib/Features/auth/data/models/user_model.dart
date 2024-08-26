import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/Features/auth/domin/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});
  factory UserModel.fromFirebase(User user) {
    {
      return UserModel(
          name: user.displayName ?? '',
          email: user.email ?? '',
          uId: user.uid);
    }
  }
}
