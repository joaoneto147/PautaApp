import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/interfaces/iauth_repository.dart';
import 'package:minhaspautas/app/models/user_model.dart';
import 'package:minhaspautas/app/repositories/user_repository.dart';
import 'package:minhaspautas/app/shared/const/router_const.dart';
import 'package:minhaspautas/app/shared/enums/app_enums.dart';
import 'package:minhaspautas/app/shared/responses/response_defult.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  IAuthRepository authRepository;
  UserRepository userRepository;

  _RegisterControllerBase() {
    authRepository = Modular.get<IAuthRepository>();
    userRepository = Modular.get<UserRepository>();
  }

  @observable
  bool registrandoUsuario = false;

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  String nome = "";

  @computed
  bool get habilitarCadastroButton =>
      this.email.isNotEmpty && this.senha.isNotEmpty && this.nome.isNotEmpty;

  @action
  void setNome(String nome) => this.nome = nome;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setSenha(String senha) => this.senha = senha;

  @action
  Future<void> registrar() async {
    registrandoUsuario = true;
    try {
      if (this.nome.trim().length == 0) {
        var response = DefaultResponse<String>(
            message: "Nome não informado!", status: ResponseStatus.rsFailed);
        throw response;
      }

      await authRepository
          .registerEmailPassword(email: this.email, password: this.senha)
          .then((response) async {
        if (response.success) {
          await userRepository.add(User(email: this.email, name: this.nome));

          Modular.to.pushReplacementNamed(RoutersConst.login);
        } else {
          throw response;
        }
      });
    } finally {
      registrandoUsuario = false;
    }
  }
}
