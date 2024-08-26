import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit/core/error/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Error in FirebaseAuthService.createUserEmailAndPassword ${e.message} and ${e.code}");
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        throw CustomException('كلمة المرور ضعيفة جداً');
      } else if (e.code == 'email-already-in-use') {
        log('لقد تم تسجيل حساب بالفعل بنفس البريد الالكتروني.');
        throw CustomException(
            'لقد تم تسجيل حساب بالفعل بنفس البريد الالكتروني.');
      } else if (e.code == 'invalid-email') {
        log('The email provided is not valid.');
        throw CustomException('البريد الالكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            'لا يوجد اتصال بالانترنت. الرجاء التحقق من اتصالك بالانترنت.');
      }
      log(' لقد حدث خطأ ما. ${e.message} and ${e.code}');
      throw CustomException('لقد حدث خطأ ما.');
    } catch (e) {
      log('Error in FirebaseAuthService.createUserEmailAndPassword ${e.toString()}');
      throw CustomException('لقد حدث خطأ ما.');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Error in FirebaseAuthService.signInWithEmailAndPassword ${e.message} and ${e.code}");
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        throw CustomException('لا يوجد مستخدم مسجل بهذا البريد الالكتروني');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        throw CustomException('كلمة المرور خاطئة');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            'لا يوجد اتصال بالانترنت. الرجاء التحقق من اتصالك بالانترنت.');
      }
      throw CustomException('لقد حدث خطأ ما.');
    } catch (e) {
      log('Error in FirebaseAuthService.signInWithEmailAndPassword ${e.toString()}');
      throw CustomException('لقد حدث خطأ ما.');
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential))
        .user!;
  }
}
