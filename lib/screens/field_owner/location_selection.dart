import 'package:futsal_booking/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../constants/controllers.dart';
import 'widgets/map.dart';

class LocationSelectionScreen extends StatelessWidget {
  const LocationSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mapController.checkLocationPermission();
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Obx(
        () => Container(
          child: (mapController.isLocationPermitted.value == true)
              ? MapWidget()
              : Center(
                  child: Text(
                    'Please enable location permissions',
                    style: whiteTextStyle.copyWith(fontSize: 22),
                  ),
                ),
        ),
      ),
    );
  }
}
