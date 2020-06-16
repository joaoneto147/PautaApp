import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/login/login_controller.dart';
import 'package:minhaspautas/app/models/pauta_model.dart';
import 'package:minhaspautas/app/repositories/pauta_repository.dart';
import 'package:mobx/mobx.dart';

part 'pauta_controller.g.dart';

class PautaController = _PautaControllerBase with _$PautaController;

abstract class _PautaControllerBase with Store {
  PautaRepository _pautaRepository;

  _PautaControllerBase() {
    _pautaRepository = Modular.get<PautaRepository>();
  }

  @observable
  bool inserindoNovaPauta = false;

  @observable
  String titulo = '';
  @observable
  String descricao = '';
  @observable
  String descricaoResumida = '';

  @computed
  bool get enableAddButton =>
      this.titulo.isNotEmpty &&
      this.descricao.isNotEmpty &&
      this.descricaoResumida.isNotEmpty;

  @action
  void limparCampos() {
    titulo = '';
    descricao = '';
    descricaoResumida = '';
    inserindoNovaPauta = false;
  }

  @action
  void setTitulo(String titulo) => this.titulo = titulo;

  @action
  void setDescricao(String descricao) => this.descricao = descricao;

  @action
  void setDescricaoResumida(String descricaoResumida) =>
      this.descricaoResumida = descricaoResumida;
  
  @action
  Future<Pauta> addPauta() async {
    inserindoNovaPauta = true;
    try {
      var usuarioLogado = await Modular.get<LoginController>().usuarioLogado();

      var pauta = Pauta(
          autor: usuarioLogado.name,
          titulo: this.titulo,
          descricao: this.descricao,
          descricaoResumida: this.descricaoResumida,
          finalizada: false);

      pauta.id = await _pautaRepository.add(pauta);

      return pauta;
    } finally {
      inserindoNovaPauta = false;
    }
  }

  Future<List<Pauta>> getAllPautas() async => await _pautaRepository.getAll();
  Future<void> updatePauta(model) async => await _pautaRepository.update(model);
}
