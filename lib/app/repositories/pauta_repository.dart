import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhaspautas/app/models/pauta_model.dart';
import 'package:minhaspautas/app/repositories/base_repository.dart';

class PautaRepository extends BaseRepositoy<Pauta> {
  @override
  String get collection => 'pautas';

  @override
  Pauta Function(DocumentSnapshot document) get fromMap =>
      (document) => Pauta.fromMap(document);
}