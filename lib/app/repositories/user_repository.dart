import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minhaspautas/app/models/user_model.dart';
import 'package:minhaspautas/app/repositories/base_repository.dart';

class UserRepository extends BaseRepositoy<User> {
  @override
  String get collection => 'users';

  @override
  User Function(DocumentSnapshot document) get fromMap =>
      (document) => User.fromMap(document);

  Future<User> getUser(String email) async {
    var collection = collectionReference;
    var query =
        await collection.where("email", isEqualTo: email).getDocuments();
    return fromMap(query.documents.first);
  }
}
