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
  final HomeController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    controller.buscarPautas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      drawer: Drawer(
        child: MenuDrawer()
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
            builder: (_) =>
                controller.statusConsulta == StatusConsulta.scConsultando
                    ? Center(child: CircularProgressIndicator())
                    : controller.listaSelecionada.length > 0
                        ? Expanded(
                            child: new ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: controller.listaSelecionada.length,
                              itemBuilder: (BuildContext context, int i) {
                                return CardPautaWidget(index: i);
                              },
                            ),
                          )
                        : Center(
                            child: Text("Nenhuma pauta para exibir!"),
                          ),
          ),
        ],
      ),
    );
  }
}
