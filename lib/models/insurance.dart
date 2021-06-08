import 'dart:convert';

import 'package:equatable/equatable.dart';

class Insurance extends Equatable {
  final String insuranceId;
  final String name;
  final String carBrand;
  final String carModel;
  final String carLicense;

  Insurance(
      {this.name,
      this.carBrand,
      this.carLicense,
      this.carModel,
      this.insuranceId});

  factory Insurance.fromJson(Map<String, dynamic> json) {
    return Insurance(
        name: utf8.decode(json['name'].toString().codeUnits),
        carBrand: json['car_brand'],
        carLicense: utf8.decode(json['car_license'].toString().codeUnits),
        carModel: json['car_model'],
        insuranceId: json['insurance_id']);
  }

  @override
  List<Object> get props => [insuranceId, name, carLicense, carModel, carBrand];
}
