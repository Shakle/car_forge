import '../database/extensions.dart';

class Car {
  final String make;
  final String model;
  final int mileage;

  Car({
    this.make,
    this.model,
    this.mileage,
  });

  Car fromJson(Map<String, dynamic> json) {
    return Car(
        make: json['make'],
        model: json['model'],
        mileage: json['mileage']
    );
  }

  Map<String, dynamic> toJson() => {
    'make': make,
    'model': model,
    'mileage': mileage
  }.removeNullValues();


}