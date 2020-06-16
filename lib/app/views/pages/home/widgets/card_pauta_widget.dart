import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/home/home_controller.dart';

class CardPautaWidget extends StatelessWidget {
  final int index;

  CardPautaWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Modular.get<HomeController>();
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
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      controller.listaSelecionada[index].titulo,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        controller.listaSelecionada[index].descricaoResumida,
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,                  
                  children: <Widget>[
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Text(
                      controller.listaSelecionada[index].descricao,
                      textAlign: TextAlign.justify,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        controller.listaSelecionada[index].autor,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        color: controller.listaSelecionada[index].finalizada
                            ? Colors.red
                            : Colors.green,
                        child: Text(
                            controller.listaSelecionada[index].finalizada
                                ? "Reabrir"
                                : "Finalizar"),
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
