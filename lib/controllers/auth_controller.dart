//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futsal_booking/constants/controllers.dart';
//import 'package:futsal_booking/constants/styles.dart';
import 'package:futsal_booking/helpers/show_loading.dart';
import 'package:futsal_booking/models/user_model.dart';
import 'package:futsal_booking/screens/field_owner/field_owner_home.dart';
//import 'package:futsal_booking/screens/field_owner/register_field.dart';
import 'package:futsal_booking/screens/authentication/auth.dart';
import 'package:futsal_booking/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:futsal_booking/constants/firebase.dart';
import '../helpers/snackbar.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  //RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<UserModel?> userModel = UserModel().obs;
  Rx<bool> isFieldOwnerChecked = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      if (user == null) {
        Get.offAll(() => AuthenticationScreen());
      } else {
        await _initializeUserModel(user.uid);
        if (userModel.value!.role == "fieldOwner") {
          Get.offAll(() => FieldOwnerHome(user: user));
        } else {
          Get.offAll(() => HomeScreen(user: user));
        }
      }
    });
  }

  void signIn() async {
    try {
      showLoading();
      await auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
    } catch (e) {
      //debugPrint(e.toString());
      Snackbar.showSnackbar("Sign In Failed", e.toString());
      dismissLoading();
    }
  }

  void signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) async {
        String _userId = result.user!.uid;
        await _addUserToFirestore(_userId);
      });
    } catch (e) {
      //debugPrint(e.toString());
      Snackbar.showSnackbar("Sign Up Failed", e.toString());
      dismissLoading();
    }
  }

  void signOut() async {
    _reset();
    auth.signOut();
  }

  _addUserToFirestore(String? userId) {
    var role = (authController.isFieldOwnerChecked.value)
        ? "fieldOwner"
        : "participant";

    usersCollection.doc(userId).set(
      {
        "name": name.text.trim(),
        "id": userId,
        "email": email.text.trim(),
        "role": role,
      },
    );
  }

  _initializeUserModel(String? userId) async {
    var _userModel = await usersCollection.doc(userId).get();
    userModel.value = UserModel.fromSnapshot(_userModel);
  }

  _reset() {
    name.clear();
    email.clear();
    password.clear();
    firebaseUser.value = null;
    isFieldOwnerChecked.value = false;
    userModel.value = null;
  }
}
