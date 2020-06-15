import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:minhaspautas/app/controllers/home/home_controller.dart';

import 'card_pauta_widget.dart';

class ListaPauta extends ModularStatelessWidget {
  final HomeController controller;

  ListaPauta(this.controller);
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: new ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 0,
            itemBuilder: (BuildContext context, int i) {
              return CardPautaWidget(index: i);
            },
          ),
        ),
      ],
    );
  }
}
