//import 'dart:html';

import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/helpers/snackbar.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as location_plugin;
//import 'package:permission_handler/permission_handler.dart';

class MapController extends GetxController {
  static MapController instance = Get.find();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}.obs;

  RxList<Placemark> placemarks = <Placemark>[].obs;
  var fieldLatLng;

  var locationPermission = location_plugin.PermissionStatus.denied.obs;
  Rx<bool> isLocationPermitted = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(20.9320, 77.7523),
    zoom: 15.4746,
  );

  // final CameraPosition kLake = const CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(37.43296265331129, -122.08832357078792),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414,
  // );

  setMarker(latLng) {
    final MarkerId markerId = MarkerId('4544');
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
    );

    markers.clear();
    // adding a new marker to map
    markers[markerId] = marker;
    fieldLatLng = latLng;
    getUserLocation();
  }

  checkLocationPermission() async {
    location_plugin.Location location = location_plugin.Location();

    bool _isLocationServiceEnabled;
    location_plugin.PermissionStatus _permissionGranted;
    location_plugin.LocationData? _locationData;

    _isLocationServiceEnabled = await location.serviceEnabled();
    if (!_isLocationServiceEnabled) {
      _isLocationServiceEnabled = await location.requestService();
      if (!_isLocationServiceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == location_plugin.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != location_plugin.PermissionStatus.granted) {
        return;
      }
      isLocationPermitted.value = true;
    }

    _locationData = await location.getLocation();
    if (_locationData.latitude != null) {
      isLocationPermitted.value = true;
    }
    // if ((Permission.location.serviceStatus.isEnabled)) {
    //   var status = await Permission.location.status;
    //   if (status.isGranted) {
    //     isLocationPermitted.value = true;
    //   } else if (status.isDenied) {
    //     Snackbar.showSnackbar("Location access required!",
    //         "This app needs location access to function. Please allow location access.");
    //   }
    // } else {
    //   Snackbar.showSnackbar(
    //       "Location Disabled!", "Please enable location services.");
    // }
  }

  getUserLocation() async {
    markers.values.forEach((value) async {
      placemarks.value = await placemarkFromCoordinates(
        value.position.latitude,
        value.position.longitude,
      );
      //print("Address: ${placemarks.first}");
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}
