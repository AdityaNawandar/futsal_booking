import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//enum Availability { available, partial, unavailable }

class FieldModel extends Equatable {
  final String fieldId;
  final String ownerId;
  final String name;
  //final String type;
  final LatLng latLng;
  final String imageUrl;
  final String description;
  final double charges;
  final List<String>? timeSlots;
  //final int price;
  final int availability;

  FieldModel({
    required this.fieldId,
    this.ownerId = '',
    this.name = '',
    //this.type = '',
    this.latLng = const LatLng(85.300140, 27.700769),
    this.imageUrl = '',
    this.description = '',
    this.charges = 0.0,
    this.timeSlots = null,
    this.availability = 0,
    //this.price = 0,
  });

  factory FieldModel.fromJson(String fieldId, Map<dynamic, dynamic> json) =>
      FieldModel(
        fieldId: fieldId,
        ownerId: json['ownerId'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        //type: json['type'],
        latLng: LatLng(
          json['latLng']['geopoint'].latitude,
          json['latLng']['geopoint'].longitude,
        ),
        description: json['description'],
        charges: double.parse(json['charges']),
        // timeSlots: jsonDecode
        // (json['timeSlots']),
        availability: json['availability'],
      );

  Map<String, dynamic> toJson() => {
        'id': fieldId,
        'ownerId': ownerId,
        'name': name,
        'imageUrl': imageUrl,
        //'type': type,
        'description': description,
        'charges': charges,
        'timeSlots': timeSlots,
        'availability': availability
      };

  static LatLng _getLatLng(json) {
    final parse = jsonDecode(json);
    final wayPorts = parse['latLng'] as List;
    var latLng;
    wayPorts.forEach((element) {
      var waypoint = element as Map<String, dynamic>;
      latLng = LatLong(waypoint['location'][0], waypoint['location'][1]);
    });
    return latLng;
  }

  @override
  List<Object?> get props => [
        fieldId,
        name,
        imageUrl,
        //type,
        charges,
        timeSlots,
        availability,
      ];
}

class LatLong {
  double lat;
  double long;

  LatLong(this.lat, this.long);
}
