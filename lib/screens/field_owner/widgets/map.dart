import 'dart:async';
import 'package:futsal_booking/widgets/select_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../constants/controllers.dart';

class MapWidget extends StatelessWidget {
  MapWidget({Key? key}) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => Stack(
          children: [
            GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: mapController.initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: Set<Marker>.of(mapController.markers.values),
                onLongPress: (LatLng latLng) {
                  mapController.setMarker(latLng);
                }),
            (mapController.placemarks.isNotEmpty)
                ? SelectAddress()
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
