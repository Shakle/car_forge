import 'package:flutter/material.dart';

import '../../data/models/car.dart';
import '../../data/models/car_regular_maintenance.dart';

abstract class CarEvent {
  final Car car;

  CarEvent({this.car});
}

class CarChanged extends CarEvent {

  CarChanged(Car car) : super(car: car);
}

class CarRegularMaintenanceChanged extends CarEvent {
  final RegularMaintenanceInfo regularMaintenanceInfo;

  CarRegularMaintenanceChanged({@required this.regularMaintenanceInfo});
}