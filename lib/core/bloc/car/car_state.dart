import '../../data/models/car.dart';

abstract class CarState {
  final Car car;

  CarState({this.car});
}

class CarInitial extends CarState {}

class CarCurrent extends CarState {
  CarCurrent({Car car}) : super(car: car);
}