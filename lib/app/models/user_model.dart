import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhaspautas/app/models/base_model.dart';

class User extends BaseModel {
  String name;
  String email;
  String password;

  User({this.name, this.email, this.password});

  User.fromMap(DocumentSnapshot document) : super.fromMap(document) {
    name = document.data['name'];
    email = document.data['email'];
  }

  @override
  Map toMap() {
    var map = super.toMap();
    map['name'] = name;
    map['email'] = email;
    return map;
  }
}
