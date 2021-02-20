import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/car.dart';
import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {

  CarBloc() : super(CarInitial());

  @override
  Stream<CarState> mapEventToState(CarEvent event) async* {
    if (event is CarChanged) {
      yield CarCurrent(car: event.car);
    } else if (event is CarRegularMaintenanceChanged) {
      yield CarCurrent(
        car: Car(
          mileage: state.car?.mileage,
          make: state.car?.make,
          model: state.car?.model,
          regularMaintenanceInfo: event.regularMaintenanceInfo
        ),
      );
    }
  }

}