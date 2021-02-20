import 'package:flutter/material.dart';

import '../../../../../core/repository/car/car_repository.dart';

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
    return filterCheckbox();
  }

  Widget title() {
    return Text(filterNames[widget.carFilter]);
  }

  Widget checkbox() {
    return Checkbox(
        value: CarRepository.carOilMaintenanceCreationData.filtersList.contains(widget.carFilter),
        onChanged: (enabled) {
          setState(() {
            enabled
                ? CarRepository.carOilMaintenanceCreationData.filtersList.add(widget.carFilter)
                : CarRepository.carOilMaintenanceCreationData.filtersList.remove(widget.carFilter);
          });
        }
    );
  }

  Widget filterCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title(),
        checkbox(),
      ],
    );
  }
}
