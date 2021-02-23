import 'package:flutter/material.dart';

import '../../../../view/components/stats/stat_card/oil_filters/filter_check.dart';
import '../../../data/models/car_regular_maintenance.dart';
import '../car_bloc.dart';

abstract class CarRegularMaintenanceEvent {
  final RegularMaintenanceInfo regularMaintenanceInfo;

  CarRegularMaintenanceEvent({this.regularMaintenanceInfo});
}

class FilterChanged extends CarRegularMaintenanceEvent {
  final CarFilter carFilter;

  FilterChanged({@required this.carFilter}) : super();
}

class MileageChanged extends CarRegularMaintenanceEvent {
  final int mileage;

  MileageChanged({@required this.mileage});
}

class EditingConfirmed extends CarRegularMaintenanceEvent {
  final CarBloc carBloc;

  EditingConfirmed({@required this.carBloc});
}