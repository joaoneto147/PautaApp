import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/home/home_controller.dart';

class CardPautaWidget extends StatelessWidget {
  final HomeController controller = Modular.get();

  final int index;

  CardPautaWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Card(
        margin: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
        child: new ExpansionPanelList(
          expansionCallback: (int index, bool collapsed) {
            if (collapsed) {
              controller.expandirItemPauta(-1);
            } else {
              controller.expandirItemPauta(this.index);
            }
          },
          children: [
            new ExpansionPanel(
              isExpanded: controller.indexPautaExp == index,
              headerBuilder: (BuildContext context, bool isExpanded) => Padding(
                padding: const EdgeInsets.only(top: 2, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      controller.listaSelecionada[index].titulo,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            style: TextStyle(color: Colors.grey),
                            text: controller.listaSelecionada[index].descricaoResumida,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.black,
                    ),
                    Text(
                      controller.listaSelecionada[index].descricao,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.listaSelecionada[index].autor,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        color: controller.listaSelecionada[index].finalizada
                            ? Colors.red
                            : Colors.green,
                        child: Text(
                            controller.listaSelecionada[index].finalizada
                                ? "Reabrir"
                                : "Finalizar",
                            textAlign: TextAlign.end),
                        onPressed: () => controller.alterStatusPauta(index),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
