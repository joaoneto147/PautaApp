import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhaspautas/app/models/base_model.dart';

class Pauta extends BaseModel {
  String autor;
  String titulo;
  String descricao;
  String descricaoResumida;
  bool finalizada = false;

  @override
  Pauta(
      {this.autor,
      this.titulo,
      this.descricao,
      this.descricaoResumida,
      this.finalizada});

  @override
  Map toMap() {
    var map = super.toMap();
    map['autor'] = autor;
    map['titulo'] = titulo;
    map['descricao'] = descricao;
    map['descricaoResumida'] = descricaoResumida;
    map['finalizada'] = finalizada;

    return map;
  }

  @override
  Pauta.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    autor = document.data['autor'];
    titulo = document.data['titulo'];
    descricao = document.data['descricao'];
    descricaoResumida = document.data['descricaoResumida'];
    finalizada = document.data['finalizada'];
  }
}
