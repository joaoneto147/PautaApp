import 'package:minhaspautas/app/shared/responses/response_defult.dart';

abstract class IAuthRepository{
  Future<DefaultResponse> doLoginEmailPassword({String email, String password});
  Future<DefaultResponse> registerEmailPassword(
      {String email, String password});
  Future<DefaultResponse> getUser();
  Future<DefaultResponse> logOut();
  Future<DefaultResponse> sendPasswordResetEmail({String email});
  Future<String> getEmailUsuarioLogado();
}