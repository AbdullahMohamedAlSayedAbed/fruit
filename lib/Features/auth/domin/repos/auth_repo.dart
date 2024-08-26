import 'package:dartz/dartz.dart';
import 'package:fruit/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit/core/error/failers.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserEmailAndPassword(String email, String password,String name);

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(String email, String password);
  Future<Either<Failures, UserEntity>> signInWithGoogle();
  Future<Either<Failures, UserEntity>> signInWithFacebook();

}