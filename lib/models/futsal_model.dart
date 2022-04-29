import 'package:google_maps_flutter/google_maps_flutter.dart';

class FutsalModel {
  final String id;
  final String name;
  final String description;
  final LatLng latLng;
  final int price;

  FutsalModel({
    required this.id,
    this.name = '',
    this.description = '',
    this.latLng = const LatLng(0.0, 0.0),
    this.price = 0,
  });

  factory FutsalModel.fromJson(String id, Map<String, dynamic> json) =>
      FutsalModel(
        id: id,
        name: json['name'],
        description: json['description'],
        latLng: json['latLng'],
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'latLng': latLng,
        'price': price,
      };
}
