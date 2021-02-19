import 'package:flutter_bloc/flutter_bloc.dart';

import 'car_event.dart';
import 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {

  CarBloc() : super(CarInitial());

  @override
  Stream<CarState> mapEventToState(CarEvent event) async* {
    if (event is CarChanged) {
      yield CarCurrent(car: event.car);
    }
  }

}