// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<bool> _$habilitarLoginButtonComputed;

  @override
  bool get habilitarLoginButton => (_$habilitarLoginButtonComputed ??=
          Computed<bool>(() => super.habilitarLoginButton,
              name: '_LoginControllerBase.habilitarLoginButton'))
      .value;

  final _$realizandoLoginAtom =
      Atom(name: '_LoginControllerBase.realizandoLogin');

  @override
  bool get realizandoLogin {
    _$realizandoLoginAtom.reportRead();
    return super.realizandoLogin;
  }

  @override
  set realizandoLogin(bool value) {
    _$realizandoLoginAtom.reportWrite(value, super.realizandoLogin, () {
      super.realizandoLogin = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_LoginControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$realizarLoginAsyncAction =
      AsyncAction('_LoginControllerBase.realizarLogin');

  @override
  Future<void> realizarLogin() {
    return _$realizarLoginAsyncAction.run(() => super.realizarLogin());
  }

  final _$recuperarSenhaAsyncAction =
      AsyncAction('_LoginControllerBase.recuperarSenha');

  @override
  Future<void> recuperarSenha({String email}) {
    return _$recuperarSenhaAsyncAction
        .run(() => super.recuperarSenha(email: email));
  }

  final _$usuarioLogadoAsyncAction =
      AsyncAction('_LoginControllerBase.usuarioLogado');

  @override
  Future<User> usuarioLogado() {
    return _$usuarioLogadoAsyncAction.run(() => super.usuarioLogado());
  }

  final _$deslogarAsyncAction = AsyncAction('_LoginControllerBase.deslogar');

  @override
  Future<void> deslogar() {
    return _$deslogarAsyncAction.run(() => super.deslogar());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void limparCampos() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.limparCampos');
    try {
      return super.limparCampos();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void doRegister() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.doRegister');
    try {
      return super.doRegister();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void doRecovery() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.doRecovery');
    try {
      return super.doRecovery();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
realizandoLogin: ${realizandoLogin},
email: ${email},
senha: ${senha},
habilitarLoginButton: ${habilitarLoginButton}
    ''';
  }
}
