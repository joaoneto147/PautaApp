import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhaspautas/app/interfaces/ibase_model.dart';

abstract class IBaseRepository<
    Model extends IBaseModel> {

  Future<String> add(Model model);

  Future<void> update(Model model);
  Future<void> delete(String documentId);
  Future<Model> getById(String documentId);
  Future<List<Model>> getAll();
  CollectionReference filter();
  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentList);
}