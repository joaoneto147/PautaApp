import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/interfaces/iauth_repository.dart';
import 'package:minhaspautas/app/models/user_model.dart';
import 'package:minhaspautas/app/repositories/user_repository.dart';
import 'package:minhaspautas/app/shared/responses/response_defult.dart';
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
  bool realizandoLogin = false;

  @observable
  String email = "";

  @observable
  String senha = "";

  @computed
  bool get habilitarLoginButton =>
      this.email.isNotEmpty && this.senha.isNotEmpty;

  @action
  void limparCampos() {
    email = '';
    senha = '';
  }

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setSenha(String senha) => this.senha = senha;

  @action
  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }

  @action
  void doRecovery() {
    Modular.to.pushNamed(RoutersConst.recuperarSenha);
  }

  @action
  Future<void> realizarLogin() async {
    realizandoLogin = true;
    try {
      await authRepository
          .doLoginEmailPassword(email: this.email, password: this.senha)
          .then((response) {
        if (response.success) {
          Modular.to.pushReplacementNamed(RoutersConst.home);
        } else {
          throw response;
        }
      });
    } finally {
      realizandoLogin = false;
    }
  }

  @action
  Future<void> recuperarSenha({String email}) async {
    if (email.isEmpty)
      throw DefaultResponse(message: "E-mail não informado!");

    await authRepository.sendPasswordResetEmail(email: email).then((response) {
      if (response.success) {
        Modular.to.pop();
      } else {
        throw response;
      }
    });
  }

  @action
  Future<User> usuarioLogado() async {
    String emailUsuarioLogado = await authRepository.getEmailUsuarioLogado();
    return userRepository.getUser(emailUsuarioLogado);
  }

  @action
  Future<void> deslogar() async {
    var response = await authRepository.logOut();
    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      throw response;
    }
  }
}
