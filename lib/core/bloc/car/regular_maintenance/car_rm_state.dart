import 'package:flutter/material.dart';

import '../../../data/models/car_regular_maintenance.dart';

abstract class CarRegularMaintenanceState {
  final RegularMaintenanceInfo regularMaintenanceInfo;

  CarRegularMaintenanceState({@required this.regularMaintenanceInfo});
}

class CarRegularMaintenanceInitial extends CarRegularMaintenanceState {
  CarRegularMaintenanceInitial({RegularMaintenanceInfo regularMaintenanceInfo})
      : super(regularMaintenanceInfo: regularMaintenanceInfo ?? RegularMaintenanceInfo(filtersList: [], mileage: 0));
}

class CarRegularMaintenanceEdited extends CarRegularMaintenanceState {
  CarRegularMaintenanceEdited({@required RegularMaintenanceInfo regularMaintenanceInfo})
      : super(regularMaintenanceInfo: regularMaintenanceInfo);
}