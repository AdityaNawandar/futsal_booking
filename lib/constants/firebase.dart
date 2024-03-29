import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
var usersCollection = firebaseFirestore.collection('users');
var fieldOwnersCollection = firebaseFirestore.collection('fieldOwners');
var fieldsCollection = firebaseFirestore.collection('fields');
