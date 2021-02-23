import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/car_regular_maintenance.dart';
import '../../../repository/car/regular_maintenance_repository.dart';
import '../car_event.dart';
import 'car_rm_event.dart';
import 'car_rm_state.dart';

class CarRegularMaintenanceBloc extends Bloc<CarRegularMaintenanceEvent, CarRegularMaintenanceState> {
  final RegularMaintenanceRepository regularMaintenanceRepository = RegularMaintenanceRepository();

  CarRegularMaintenanceBloc() : super(CarRegularMaintenanceInitial());

  @override
  Stream<CarRegularMaintenanceState> mapEventToState(CarRegularMaintenanceEvent event) async* {
    if (event is FilterChanged) {
      yield filterChanged(event);
    } else if (event is MileageChanged) {
      yield mileageChanged(event);
    } else if (event is EditingConfirmed) {
      yield editingConfirmed(event);
    }
  }

  CarRegularMaintenanceState editingConfirmed(EditingConfirmed event) {
    final CarRegularMaintenanceChanged maintenanceChangedEvent = CarRegularMaintenanceChanged(
        regularMaintenanceInfo: state.regularMaintenanceInfo
    );
    event.carBloc.add(maintenanceChangedEvent);
    return CarRegularMaintenanceInitial();
  }

  CarRegularMaintenanceState filterChanged(FilterChanged event) {
    final RegularMaintenanceInfo carRegularMaintenance = state.regularMaintenanceInfo
      ..filtersList = regularMaintenanceRepository
          .getChangedCarFilters(
            currentStateCarFilters: state.regularMaintenanceInfo.filtersList,
            editedCarFilter: event.carFilter
      );

    return CarRegularMaintenanceEdited(regularMaintenanceInfo: carRegularMaintenance);
  }

  CarRegularMaintenanceState mileageChanged(MileageChanged event) {
    final RegularMaintenanceInfo carRegularMaintenance = state.regularMaintenanceInfo
      ..mileage = event.mileage;

    return CarRegularMaintenanceEdited(regularMaintenanceInfo: carRegularMaintenance);
  }

}