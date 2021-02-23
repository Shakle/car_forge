import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/car/car_bloc.dart';
import '../../bloc/car/car_event.dart';
import '../../data/models/car_regular_maintenance.dart';

class CarRepository {

  void addCarMaintenanceData(BuildContext context, RegularMaintenanceInfo regularMaintenanceInfo) {
    BlocProvider.of<CarBloc>(context).add(
      CarRegularMaintenanceChanged(regularMaintenanceInfo: regularMaintenanceInfo),
    );
  }

}