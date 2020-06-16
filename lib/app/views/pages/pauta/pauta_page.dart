import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/pauta/pauta_controller.dart';

class PautaPage extends StatefulWidget {
  @override
  _PautaPageState createState() => _PautaPageState();
}

class _PautaPageState extends State<PautaPage> {
  PautaController _pautaController;

  @override
  void initState() {
    _pautaController = Modular.get();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pautaController.limparCampos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Adicionar pauta"),
        ),
        body: SingleChildScrollView(
          child: Observer(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: _pautaController.setTitulo,
                      decoration: InputDecoration(
                        hintText: "Digite o título",
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      onChanged: _pautaController.setDescricaoResumida,
                      decoration: InputDecoration(
                        hintText: "Breve descrição",
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: TextField(
                        maxLines: 15,
                        keyboardType: TextInputType.multiline,
                        onChanged: _pautaController.setDescricao,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: "Detalhes",
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        alignment: Alignment.center,
                        child: Text(
                          "Adicionar",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      onPressed: _pautaController.enableAddButton
                          ? () async =>
                              Modular.to.pop(await _pautaController.addPauta())
                          : null,
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        alignment: Alignment.center,
                        child: Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      onPressed: () => Modular.to.pop(null),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
