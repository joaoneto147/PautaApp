// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$usuarioLogadoAtom = Atom(name: '_HomeControllerBase.usuarioLogado');

  @override
  User get usuarioLogado {
    _$usuarioLogadoAtom.reportRead();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(User value) {
    _$usuarioLogadoAtom.reportWrite(value, super.usuarioLogado, () {
      super.usuarioLogado = value;
    });
  }

  final _$listaSelecionadaAtom =
      Atom(name: '_HomeControllerBase.listaSelecionada');

  @override
  List<Pauta> get listaSelecionada {
    _$listaSelecionadaAtom.reportRead();
    return super.listaSelecionada;
  }

  @override
  set listaSelecionada(List<Pauta> value) {
    _$listaSelecionadaAtom.reportWrite(value, super.listaSelecionada, () {
      super.listaSelecionada = value;
    });
  }

  final _$statusPautaSelectedAtom =
      Atom(name: '_HomeControllerBase.statusPautaSelected');

  @override
  StatusPautaSelecionada get statusPautaSelected {
    _$statusPautaSelectedAtom.reportRead();
    return super.statusPautaSelected;
  }

  @override
  set statusPautaSelected(StatusPautaSelecionada value) {
    _$statusPautaSelectedAtom.reportWrite(value, super.statusPautaSelected, () {
      super.statusPautaSelected = value;
    });
  }

  final _$indexPautaExpAtom = Atom(name: '_HomeControllerBase.indexPautaExp');

  @override
  int get indexPautaExp {
    _$indexPautaExpAtom.reportRead();
    return super.indexPautaExp;
  }

  @override
  set indexPautaExp(int value) {
    _$indexPautaExpAtom.reportWrite(value, super.indexPautaExp, () {
      super.indexPautaExp = value;
    });
  }

  final _$abaSelecionadaAtom = Atom(name: '_HomeControllerBase.abaSelecionada');

  @override
  StatusPautaSelecionada get abaSelecionada {
    _$abaSelecionadaAtom.reportRead();
    return super.abaSelecionada;
  }

  @override
  set abaSelecionada(StatusPautaSelecionada value) {
    _$abaSelecionadaAtom.reportWrite(value, super.abaSelecionada, () {
      super.abaSelecionada = value;
    });
  }

  final _$statusConsultaAtom = Atom(name: '_HomeControllerBase.statusConsulta');

  @override
  StatusConsulta get statusConsulta {
    _$statusConsultaAtom.reportRead();
    return super.statusConsulta;
  }

  @override
  set statusConsulta(StatusConsulta value) {
    _$statusConsultaAtom.reportWrite(value, super.statusConsulta, () {
      super.statusConsulta = value;
    });
  }

  final _$buscarPautasAsyncAction =
      AsyncAction('_HomeControllerBase.buscarPautas');

  @override
  Future<void> buscarPautas() {
    return _$buscarPautasAsyncAction.run(() => super.buscarPautas());
  }

  final _$alterStatusPautaAsyncAction =
      AsyncAction('_HomeControllerBase.alterStatusPauta');

  @override
  Future<void> alterStatusPauta(int indexPauta) {
    return _$alterStatusPautaAsyncAction
        .run(() => super.alterStatusPauta(indexPauta));
  }

  final _$obterUsuarioLogadoAsyncAction =
      AsyncAction('_HomeControllerBase.obterUsuarioLogado');

  @override
  Future<void> obterUsuarioLogado() {
    return _$obterUsuarioLogadoAsyncAction
        .run(() => super.obterUsuarioLogado());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void expandirItemPauta(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.expandirItemPauta');
    try {
      return super.expandirItemPauta(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic adicionarPautaLista(Pauta pauta) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.adicionarPautaLista');
    try {
      return super.adicionarPautaLista(pauta);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic atualizarListaSelecionada() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.atualizarListaSelecionada');
    try {
      return super.atualizarListaSelecionada();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alterarAbaSelecionada(StatusPautaSelecionada abaSelecionada) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.alterarAbaSelecionada');
    try {
      return super.alterarAbaSelecionada(abaSelecionada);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuarioLogado: ${usuarioLogado},
listaSelecionada: ${listaSelecionada},
statusPautaSelected: ${statusPautaSelected},
indexPautaExp: ${indexPautaExp},
abaSelecionada: ${abaSelecionada},
statusConsulta: ${statusConsulta}
    ''';
  }
}
