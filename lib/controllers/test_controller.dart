// //import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/constants/styles.dart';
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
//import '../screens/field_owner/location_selection.dart';
//import '../screens/field_owner/field.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<UserModel> userModel = UserModel().obs;
  Rx<bool> isFieldOwnerChecked = false.obs;
  bool isSigningUp = false;
  bool isSigningIn = false;
  Rx<bool> isValidCredentials = false.obs;

  @override
  void onInit() {
    super.onInit();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
      if (isSigningUp == true) {
        await _addUserToFirestore(user.uid);
      }
      await _initializeUserModel(user.uid);
      if (isSigningIn == true) {
        if (isValidCredentials.value == true) {
          _clearControllers();
          if (userModel.value.role == "fieldOwner") {
            Get.offAll(() => FieldOwnerHome(user: user));
          } else {
            Get.offAll(() => HomeScreen(user: user));
          }
        }
      } else {
        _clearControllers();
        if (userModel.value.role == "fieldOwner") {
          Get.offAll(() => FieldOwnerHome(user: user));
        } else {
          Get.offAll(() => HomeScreen(user: user));
        }
      }
    }
  }

  void signIn() async {
    try {
      isSigningUp = false;
      isSigningIn = true;
      showLoading();
      await auth
          .signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((result) async {
        //_clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Sign In Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        overlayColor: kOrangeColor,
      );
      dismissLoading();
    }
  }

  void signUp() async {
    isSigningUp = true;
    isSigningIn = false;
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) async {});
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        "Sign Up Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      dismissLoading();
    }
  }

  void signOut() async {
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
    if (!(isFieldOwnerChecked.value ==
        (userModel.value.role == "fieldOwner"))) {
      isValidCredentials.value = false;
      dismissLoading();
      Get.snackbar(
        "Error",
        "ID not registered.",
        snackPosition: SnackPosition.BOTTOM,
        overlayColor: kOrangeColor,
        overlayBlur: 10,
      );
    } else {
      isValidCredentials.value = true;
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
    isFieldOwnerChecked.value = false;
    userModel.value = UserModel();
  }
}
