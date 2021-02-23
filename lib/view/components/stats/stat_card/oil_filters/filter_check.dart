import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/car/regular_maintenance/car_rm_bloc.dart';
import '../../../../../core/bloc/car/regular_maintenance/car_rm_event.dart';
import '../../../../../core/bloc/car/regular_maintenance/car_rm_state.dart';

enum CarFilter {oil, fuel, air, cabin}

class FilterCheckbox extends StatefulWidget {

  final CarFilter carFilter;

  const FilterCheckbox({@required this.carFilter, Key key}) : super(key: key);

  @override
  _FilterCheckboxState createState() => _FilterCheckboxState();
}

class _FilterCheckboxState extends State<FilterCheckbox> {

  final Map<CarFilter, String> filterNames = {
    CarFilter.oil: 'Маслянный фильтр',
    CarFilter.fuel: 'Топливный фильтр',
    CarFilter.air: 'Воздушный фильтр',
    CarFilter.cabin: 'Фильтр салона',
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarRegularMaintenanceBloc, CarRegularMaintenanceState>(
        builder: (context, state) {
          return filterCheckbox(state);
        }
    );
  }

  Widget title() {
    return Text(filterNames[widget.carFilter]);
  }

  Widget checkbox(CarRegularMaintenanceState state) {
    return Checkbox(
        value: state.regularMaintenanceInfo.filtersList.contains(widget.carFilter),
        onChanged: (enabled) {
          final FilterChanged filterChanged = FilterChanged(carFilter: widget.carFilter);
          BlocProvider.of<CarRegularMaintenanceBloc>(context).add(filterChanged);
        }
    );
  }

  Widget filterCheckbox(CarRegularMaintenanceState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title(),
        checkbox(state),
      ],
    );
  }
}
