import '../database/extensions.dart';
import 'car_filters.dart';

class Car {
  final String make;
  final String model;
  final int mileage;
  final RegularMaintenanceInfo regularMaintenanceInfo;

  Car({
    this.make,
    this.model,
    this.mileage,
    this.regularMaintenanceInfo,
  });

  Car fromJson(Map<String, dynamic> json) {
    return Car(
        make: json['make'],
        model: json['model'],
        mileage: json['mileage'],
        regularMaintenanceInfo: RegularMaintenanceInfo.fromJson(json['regular_maintenance'])
    );
  }

  Map<String, dynamic> toJson() => {
    'make': make,
    'model': model,
    'mileage': mileage,
    'regular_maintenance': regularMaintenanceInfo.toJson()
  }.removeNullValues();


}