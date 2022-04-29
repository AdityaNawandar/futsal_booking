import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/field_model.dart';

class FieldController extends GetxController {
  static FieldController instance = Get.find();
  RxList<FieldModel> fields = <FieldModel>[].obs;
  RxBool isFieldSelected = false.obs;
  RxBool isFieldAvailable = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadFields();
  }

  void loadFields() async {
    try {
      final CollectionReference _fieldsRef =
          FirebaseFirestore.instance.collection('fields');
      QuerySnapshot snapshot = await _fieldsRef.get();

      fields.value = snapshot.docs.map((e) {
        return FieldModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      Get.snackbar("Error fetching Fields", e.toString());
      return null;
    }
  }
}
