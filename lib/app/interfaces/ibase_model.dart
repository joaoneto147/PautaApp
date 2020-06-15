import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IBaseModel{
  String documentId();
    Map toMap();
  IBaseModel.fromMap(DocumentSnapshot document);

}