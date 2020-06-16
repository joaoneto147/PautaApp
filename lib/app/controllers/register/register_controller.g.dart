// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<bool> _$habilitarCadastroButtonComputed;

  @override
  bool get habilitarCadastroButton => (_$habilitarCadastroButtonComputed ??=
          Computed<bool>(() => super.habilitarCadastroButton,
              name: '_RegisterControllerBase.habilitarCadastroButton'))
      .value;

  final _$registrandoUsuarioAtom =
      Atom(name: '_RegisterControllerBase.registrandoUsuario');

  @override
  bool get registrandoUsuario {
    _$registrandoUsuarioAtom.reportRead();
    return super.registrandoUsuario;
  }

  @override
  set registrandoUsuario(bool value) {
    _$registrandoUsuarioAtom.reportWrite(value, super.registrandoUsuario, () {
      super.registrandoUsuario = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_RegisterControllerBase.senha');

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

  final _$nomeAtom = Atom(name: '_RegisterControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$registrarAsyncAction =
      AsyncAction('_RegisterControllerBase.registrar');

  @override
  Future<void> registrar() {
    return _$registrarAsyncAction.run(() => super.registrar());
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  void setNome(String nome) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setSenha');
    try {
      return super.setSenha(senha);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
registrandoUsuario: ${registrandoUsuario},
email: ${email},
senha: ${senha},
nome: ${nome},
habilitarCadastroButton: ${habilitarCadastroButton}
    ''';
  }
}
