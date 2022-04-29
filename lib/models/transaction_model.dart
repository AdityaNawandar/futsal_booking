import 'package:futsal_booking/models/field_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final FieldModel field;
  final int number;
  final String id;

  TransactionModel({
    required this.field,
    required this.number,
    this.id = '',
  });

  factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        field: FieldModel.fromJson(json['lapangan']['id'], json['lapangan']),
        id: id,
        number: json['nomor'],
      );

  @override
  List<Object?> get props => [field, number];
}
