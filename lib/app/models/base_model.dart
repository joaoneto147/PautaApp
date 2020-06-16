import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhaspautas/app/interfaces/ibase_model.dart';

class BaseModel implements IBaseModel {
  String id;

  BaseModel();

  @override
  String documentId() => id;

  @override
  Map toMap() {
    var map = <String, dynamic>{};

    return map;
  }

  @override
  BaseModel.fromMap(DocumentSnapshot document) {
    id = document.documentID;
  }
}
