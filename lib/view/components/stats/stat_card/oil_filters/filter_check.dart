import 'package:flutter/material.dart';

enum CarFilter {oil, fuel, air, cabin}

class FilterCheckbox extends StatefulWidget {

  final CarFilter carFilter;

  const FilterCheckbox({@required this.carFilter, Key key}) : super(key: key);

  @override
  _FilterCheckboxState createState() => _FilterCheckboxState();
}

class _FilterCheckboxState extends State<FilterCheckbox> {
  bool enabled = false;

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
        value: enabled,
        onChanged: (value) {
          setState(() {
            enabled = value;
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
