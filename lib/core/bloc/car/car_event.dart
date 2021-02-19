import '../../data/models/car.dart';

abstract class CarEvent {
  final Car car;

  CarEvent({this.car});
}

class CarChanged extends CarEvent {

  CarChanged(Car car) : super(car: car);
}