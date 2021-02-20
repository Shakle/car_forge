import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/car/car_bloc.dart';
import '../../../../../core/bloc/car/car_state.dart';
import '../../../../../core/data/models/car.dart';
import '../oil_filters/filter_check.dart';

class OilChangeStatLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return layout();
  }

  Widget layout() {
    return Stack(
      children: [
        settingsIcon(),
        stateLayout(),
      ],
    );
  }

  Widget stateLayout() {
    return BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state.car == null) {
            return oilNotSetLayout();
          } else {
            return oilSetLayout(state.car);
          }
        }
    );
  }

  Widget oilNotSetLayout() {
    return Center(
      child: Text(
        'Когда вы последний раз меняли\n масло и фильтры?',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget oilSetLayout(Car car) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List<Widget>.generate(CarFilter.values.length, (index) => filterText(CarFilter.values[index], car)),
          SizedBox(height: 10),
          mileageText(car),
        ],
      ),
    );
  }

  Widget mileageText(Car car) {
    final String mileage = car.regularMaintenanceInfo.mileage.toString();

    return Text('Пробег: $mileage км');
  }
  
  Widget filterText(CarFilter carFilter, Car car) {
    final bool filterChanged = car.regularMaintenanceInfo.filtersList.contains(carFilter);

    return Row(
      children: [
        filterIcon(filterChanged: filterChanged),
        SizedBox(width: 5),
        Text(getFilterText(carFilter)),
      ],
    );
  }

  Widget settingsIcon() {
    return Positioned(
      top: 15,
      right: 0,
      child: Icon(
          Icons.settings,
          size: 20,
          color: Colors.grey,
      ),
    );
  }

  String getFilterText(CarFilter carFilter) {
    switch (carFilter) {

      case CarFilter.oil: return 'Маслянный';
      case CarFilter.fuel: return 'Топливный';
      case CarFilter.air: return 'Воздушный';
      case CarFilter.cabin: return 'Салона';
      default: return '';
    }
  }

  Widget filterIcon({bool filterChanged}) {
    return Icon(
        Icons.check,
        size: 20,
        color: filterChanged
            ? Colors.green
            : Colors.transparent
    );
  }
}
