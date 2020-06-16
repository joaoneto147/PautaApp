import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/shared/const/router_const.dart';
import 'package:minhaspautas/app/shared/enums/app_enums.dart';
import 'package:minhaspautas/app/views/pages/home/widgets/menu_drawer.dart';
import 'widgets/card_pauta_widget.dart';

import 'package:minhaspautas/app/controllers/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Pautas"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController>
    with TickerProviderStateMixin {
  TabController _tabController;
  final HomeController controller = Modular.get<HomeController>();

  int getQtdItens() {
    if (controller.listaSelecionada != null)
      return max(controller.listaSelecionada.length, 1);
    else
      return 1;
  }

  @override
  initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    controller.buscarPautas();
    controller.obterUsuarioLogado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var pautaAdicionada = await Modular.to.pushNamed(RoutersConst.pauta);

          if (pautaAdicionada != null) {
            controller.adicionarPautaLista(pautaAdicionada);
            _tabController.animateTo(StatusPautaSelecionada.spsAberta.index);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: Observer(
        builder: (context) {
          return Drawer(
              child: MenuDrawer(
            user: controller.usuarioLogado,
          ));
        },
      ),
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.blueGrey,
          controller: _tabController,
          onTap: (int index) {
            controller
                .alterarAbaSelecionada(StatusPautaSelecionada.values[index]);
          },
          tabs: <Widget>[
            Tab(text: "Abertas"),
            Tab(text: "Fechadas"),
          ],
        ),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (detail) {
          final double sense = 1.8;
          if (_tabController.index == 0 && detail.delta.dx < -sense) {
            controller.alterarAbaSelecionada(StatusPautaSelecionada.spsFechada);
            _tabController.animateTo(StatusPautaSelecionada.spsFechada.index);
          } else if (_tabController.index == 1 && detail.delta.dx > sense) {
            _tabController.animateTo(StatusPautaSelecionada.spsAberta.index);
            controller.alterarAbaSelecionada(StatusPautaSelecionada.spsAberta);
          }
        },
        child: RefreshIndicator(
          onRefresh: controller.buscarPautas,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (context) {
                int qtdItens = getQtdItens();
                return controller.statusConsulta == StatusConsulta.scConsultando
                    ? Center(child: CircularProgressIndicator())
                    : Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: qtdItens,
                          itemBuilder: (BuildContext context, int i) {
                            return controller.listaSelecionada.length > 0
                                ? CardPautaWidget(index: i)
                                : Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text("Nenhum item para exibir"),
                                    ),
                                  );
                          },
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
