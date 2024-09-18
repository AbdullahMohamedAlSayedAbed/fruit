import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email, password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Error in createUserEmailAndPassword ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user =
          await firebaseAuthService.signInWithEmailAndPassword(email, password);
      var userEntity = await getUserData(uId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Error in signInWithEmailAndPassword ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseService.checkIfDataExists(
          path: BackendEndpoint.getUserData, documentId: userEntity.uId);
      if (!isUserExist) {
        await addUserData(user: userEntity);
        return right(userEntity);
      }{
        var userData = await getUserData(uId: userEntity.uId);
        return right(userData);
      }
    } catch (e) {
      await deleteUser(user);
      log('Error in signInWithGoogle ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);
      await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Error in signInWithFacebook ${e.toString()}');
      return left(ServerFailure('لقد حدث خطأ ما.'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData,
        data: user.toMap(),
        documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uId);
    return UserModel.fromJson(userData);
  }
}
