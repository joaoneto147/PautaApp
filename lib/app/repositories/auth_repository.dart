import 'package:firebase_auth/firebase_auth.dart';
import 'package:minhaspautas/app/interfaces/iauth_repository.dart';
import 'package:minhaspautas/app/shared/errors/error_interceptor.dart';

import '../shared/responses/response_defult.dart';
import '../shared/responses/response_builder.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository(this.firebaseAuth);

  Future<String> getEmailUsuarioLogado() async {
    var currentUser = await firebaseAuth.currentUser();
    return currentUser.email;
  }

  @override
  Future<DefaultResponse> doLoginEmailPassword(
      {String email, String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } catch (e) {
      return ResponseBuilder.failed(
          object: e, message: e.code, errorInterceptor: ErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> getUser() async {
    try {
      return ResponseBuilder.success<FirebaseUser>(
          object: await firebaseAuth.currentUser());
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> logOut() async {
    try {
      await firebaseAuth.signOut();
      return ResponseBuilder.success();
    } on Exception catch (e) {
      return ResponseBuilder.failed(object: e, message: e.toString());
    }
  }

  @override
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password}) async {
    try {
      return await firebaseAuth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
        (auth) {
          return ResponseBuilder.success<FirebaseUser>(object: auth.user);
        },
      );
    } catch (e) {
      return ResponseBuilder.failed(
          object: e, message: e.code, errorInterceptor: ErrorInterceptor());
    }
  }

  @override
  Future<DefaultResponse> sendPasswordResetEmail({String email}) async {
    try {    
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return ResponseBuilder.success();
    } catch (e) {
      return ResponseBuilder.failed(
          object: e, message: e.code, errorInterceptor: ErrorInterceptor());
    }
  }
}
