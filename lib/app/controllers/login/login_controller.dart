import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/interfaces/iauth_repository.dart';
import 'package:minhaspautas/app/models/user_model.dart';
import 'package:minhaspautas/app/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:minhaspautas/app/shared/const/router_const.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  IAuthRepository authRepository;
  UserRepository userRepository;

  _LoginControllerBase() {
    authRepository = Modular.get<IAuthRepository>();
    userRepository = Modular.get<UserRepository>();
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @computed
  bool get habilitarLoginButton =>
      this.email.isNotEmpty && this.senha.isNotEmpty;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setSenha(String senha) => this.senha = senha;

  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }

  void doRecovery() {}

  Future<void> realizarLogin() async {
    await authRepository
        .doLoginEmailPassword(email: this.email, password: this.senha)
        .then((response) {
      if (response.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        throw response;
      }
    });
  }

  Future<User> usuarioLogado() async {
    String emailUsuarioLogado = await authRepository.getEmailUsuarioLogado();    
    return userRepository.getUser(emailUsuarioLogado);
  }

  Future<void> deslogar() async {
    var response = await authRepository.logOut();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      throw response;
    }
  }
}
