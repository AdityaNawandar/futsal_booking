import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants/controllers.dart';
import '../constants/firebase.dart';
import '../helpers/snackbar.dart';
import '../models/field_model.dart';

class FieldOwnerController extends GetxController {
  static FieldOwnerController instance = Get.find();
  var fieldAddress = "".obs;

  TextEditingController nameCtrlr = TextEditingController();
  TextEditingController descriptionCtrlr = TextEditingController();
  TextEditingController chargesCtrlr = TextEditingController();
  // Create the controller.

  Rx<TextEditingController> addressCtrlr = TextEditingController().obs;

  final CollectionReference fieldsCollection =
      FirebaseFirestore.instance.collection('fields');

  Stream<QuerySnapshot> getStream() {
    return fieldsCollection.snapshots();
  }

  checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied || status.isLimited || status.isRestricted) {
      // You can request multiple permissions at once.
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        //Permission.camera,
      ].request();
      print(statuses[
          Permission.storage]); // it should print PermissionStatus.granted
    }
  }

  void addField() async {
    var _imageUrl = await imageController.getDownloadUrl();
    Geoflutterfire geo = Geoflutterfire();
    GeoFirePoint fieldLocation = geo.point(
      latitude: mapController.fieldLatLng.latitude,
      longitude: mapController.fieldLatLng.longitude,
    );
    try {
      var fieldModel = {
        "fieldId": '',
        "ownerId": auth.currentUser!.uid,
        "name": nameCtrlr.text.trim(),
        "address": addressCtrlr.value.text.trim(),
        "imageUrl": _imageUrl,
        "latLng": fieldLocation.data,
        "description": descriptionCtrlr.text.trim(),
        "charges": chargesCtrlr.text.trim(),
        "timeSlots": [],
        "availability": 0,
      };
      fieldsCollection.add(fieldModel);
      Snackbar.showSnackbar("Success", "Field registered successfully!");
    } catch (e) {
      Snackbar.showSnackbar("Failed", "Field could not be registered!");
    }
  }

  void updateField(FieldModel fieldModel) async {
    //await futsalRef.doc(futsalModel.referenceId).update(futsalModel.toJson());
  }

  void deleteField(FieldModel fieldModel) async {
    //await futsalRef.doc(futsalModel.referenceId).delete();
  }

  selectFieldLocation(completeAddress) {
    var locationDetails = {
      "latLng": mapController.fieldLatLng,
      "address": completeAddress
    };
    Get.toNamed('register_field', arguments: locationDetails);
    //Get.toNamed('register_field', arguments: [fieldLatLng, completeAddress]);
  }

  goToFieldLocationSelection() {
    Get.toNamed('location_selection');
  }

  assignAddress() {
    dynamic argumentData = Get.arguments;
    addressCtrlr.value.text = argumentData["address"];
  }
}
