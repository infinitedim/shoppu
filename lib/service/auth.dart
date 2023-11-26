import 'dart:developer';
import 'package:shoppu/enums.dart';
import 'package:shoppu/error/error_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final auth = FirebaseAuth.instance;
  static late AuthStatus status;
  User? currentFirebaseUser;

  Future<AuthStatus> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleAuthException(e);
    }
    return status;
  }

  Future<AuthStatus> signUp({
    required String email,
    required String password,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      status = AuthStatus.successful;
    } on FirebaseAuthException catch (e) {
      status = AuthExceptionHandler.handleAuthException(e);
    }
    return status;
  }

  Future<AuthStatus> resetPassword({required String email}) async {
    await auth
        .sendPasswordResetEmail(email: email)
        .then((value) => status = AuthStatus.successful)
        .catchError(
            (e) => status = AuthExceptionHandler.handleAuthException(e));
    return status;
  }

  Future<AuthStatus> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      status = AuthStatus.successful;
    } on FirebaseAuthException catch (error) {
      log('$error');
    }
    return status;
  }
}
