import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/car/car_bloc.dart';
import '../../bloc/car/car_event.dart';
import '../../data/models/car_filters.dart';

class CarRepository {

  static RegularMaintenanceInfo carOilMaintenanceCreationData;

  void addCarMaintenanceData(BuildContext context) {
    if (carOilMaintenanceCreationData != null) {
      BlocProvider.of<CarBloc>(context).add(
          CarRegularMaintenanceChanged(regularMaintenanceInfo: carOilMaintenanceCreationData),
      );
      Navigator.pop(context);
    }
  }

}