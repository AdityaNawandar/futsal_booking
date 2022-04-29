import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const ROLE = "role";

  String? id;
  String? name;
  String? email;
  String? role;

  UserModel({this.id = '', this.name = '', this.email = '', this.role = ''});

  UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    //if (snapshot.data() != null) {
    name = snapshot.data()![NAME];
    email = snapshot.data()![EMAIL];
    id = snapshot.data()![ID];
    role = snapshot.data()![ROLE];
  }
  //}
}
