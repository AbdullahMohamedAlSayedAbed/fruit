import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit/Features/auth/data/models/user_model.dart';
import 'package:fruit/Features/auth/domin/entites/user_entity.dart';
import 'package:fruit/Features/auth/domin/repos/auth_repo.dart';
import 'package:fruit/core/Utils/backend_endpoint.dart';
import 'package:fruit/core/error/custom_exception.dart';
import 'package:fruit/core/error/failers.dart';
import 'package:fruit/core/services/database_service.dart';
import 'package:fruit/core/services/firebase_auth_service.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
          var userEntity = UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Error in createUserEmailAndPassword ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);
      return right(UserModel.fromFirebase(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithEmailAndPassword ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebase(user));
    } catch (e) {
      log('Error in signInWithGoogle ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebase(user));
    } catch (e) {
      log('Error in signInWithFacebook ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(BackendEndpoint.addUserData, user.toMap());
  }
}
