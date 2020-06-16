import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/pauta/pauta_controller.dart';
import 'package:minhaspautas/app/models/pauta_model.dart';
import 'package:minhaspautas/app/shared/enums/app_enums.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  PautaController _pautaController = Modular.get<PautaController>();

  List<Pauta> _listaPauta;

  @observable
  List<Pauta> listaSelecionada;

  @observable
  StatusPautaSelecionada statusPautaSelected;

  @observable
  int indexPautaExp;

  @observable
  StatusPautaSelecionada abaSelecionada = StatusPautaSelecionada.spsAberta;

  @observable
  StatusConsulta statusConsulta;

  @action
  void expandirItemPauta(int index) {
    indexPautaExp = index;
  }

  @action
  Future<void> buscarPautas() async {
    statusConsulta = StatusConsulta.scConsultando;

    statusPautaSelected = StatusPautaSelecionada.spsAberta;
    try {
      _listaPauta = await _pautaController.getAllPautas();
      atualizarListaSelecionada();
    } finally {
      statusConsulta = StatusConsulta.scFinalizada;
    }

    statusConsulta = StatusConsulta.scFinalizada;
  }

  @action
  adicionarPautaLista(Pauta pauta) {
    _listaPauta.add(pauta);
    alterarAbaSelecionada(StatusPautaSelecionada.spsAberta);    
  }

  @action
  atualizarListaSelecionada() {
    expandirItemPauta(-1);
    if (abaSelecionada == StatusPautaSelecionada.spsAberta)
      listaSelecionada = _listaPauta.where((i) => !i.finalizada).toList();
    else
      listaSelecionada = _listaPauta.where((i) => i.finalizada).toList();
  }

  @action
  void alterarAbaSelecionada(StatusPautaSelecionada abaSelecionada) {
    this.abaSelecionada = abaSelecionada;    
    atualizarListaSelecionada();
  }

  @action
  Future<void> alterStatusPauta(int indexPauta) async {
    listaSelecionada[indexPauta].finalizada =
        !listaSelecionada[indexPauta].finalizada;
    var pautaUpdate = listaSelecionada[indexPauta];    
    atualizarListaSelecionada();    
        
    await _pautaController.updatePauta(pautaUpdate);    
  }
}
