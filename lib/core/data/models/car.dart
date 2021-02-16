import '../database/extensions.dart';

class Car {
  final String make;
  final String model;

  Car({
    this.make,
    this.model
  });

  Car fromJson(Map<String, dynamic> json) {
    return Car(
        make: json['make'],
        model: json['model'],
    );
  }

  Map<String, dynamic> toJson() => {
    'make': make,
    'model': model,
  }.removeNullValues();


}