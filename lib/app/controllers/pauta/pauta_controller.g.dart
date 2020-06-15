// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pauta_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PautaController on _PautaControllerBase, Store {
  Computed<bool> _$enableAddButtonComputed;

  @override
  bool get enableAddButton =>
      (_$enableAddButtonComputed ??= Computed<bool>(() => super.enableAddButton,
              name: '_PautaControllerBase.enableAddButton'))
          .value;

  final _$tituloAtom = Atom(name: '_PautaControllerBase.titulo');

  @override
  String get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(String value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$descricaoAtom = Atom(name: '_PautaControllerBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$descricaoResumidaAtom =
      Atom(name: '_PautaControllerBase.descricaoResumida');

  @override
  String get descricaoResumida {
    _$descricaoResumidaAtom.reportRead();
    return super.descricaoResumida;
  }

  @override
  set descricaoResumida(String value) {
    _$descricaoResumidaAtom.reportWrite(value, super.descricaoResumida, () {
      super.descricaoResumida = value;
    });
  }

  final _$_PautaControllerBaseActionController =
      ActionController(name: '_PautaControllerBase');

  @override
  void limparCampos() {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.limparCampos');
    try {
      return super.limparCampos();
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitulo(String titulo) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setTitulo');
    try {
      return super.setTitulo(titulo);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String descricao) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setDescricao');
    try {
      return super.setDescricao(descricao);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricaoResumida(String descricaoResumida) {
    final _$actionInfo = _$_PautaControllerBaseActionController.startAction(
        name: '_PautaControllerBase.setDescricaoResumida');
    try {
      return super.setDescricaoResumida(descricaoResumida);
    } finally {
      _$_PautaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titulo: ${titulo},
descricao: ${descricao},
descricaoResumida: ${descricaoResumida},
enableAddButton: ${enableAddButton}
    ''';
  }
}
