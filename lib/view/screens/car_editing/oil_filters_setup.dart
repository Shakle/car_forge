import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/car/car_bloc.dart';
import '../../../core/bloc/car/regular_maintenance/car_rm_bloc.dart';
import '../../../core/bloc/car/regular_maintenance/car_rm_event.dart';
import '../../../core/data/config/app_config.dart';
import '../../components/app_general/buttons.dart';
import '../../components/stats/stat_card/oil_filters/filter_check.dart';
import '../../components/stats/stat_card/oil_filters/mileage_check.dart';

class OilFiltersEditingBottomSheet extends StatefulWidget {
  
  @override
  _OilFiltersEditingBottomSheetState createState() => _OilFiltersEditingBottomSheetState();
}

class _OilFiltersEditingBottomSheetState extends State<OilFiltersEditingBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return layout(context);
  }

  Widget layout(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...filtersList(),
          SizedBox(height: 15),
          mileageEditor(),
          SizedBox(height: 15),
          OvalButton(function: () => confirmEditing(context), title: 'Готово'),
          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
        ],
      ),
    );
  }

  Widget mileageEditor() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConfig.screenWidth(context) * 0.15),
      child: MileageEditor(),
    );
  }

  List<Widget> filtersList() {
    return List<Widget>.generate(CarFilter.values.length, (index)
    => FilterCheckbox(carFilter: CarFilter.values[index]));
  }

  void confirmEditing(BuildContext context) {
    final EditingConfirmed editingConfirmed = EditingConfirmed(carBloc: BlocProvider.of<CarBloc>(context));
    BlocProvider.of<CarRegularMaintenanceBloc>(context).add(editingConfirmed);
    Navigator.pop(context);
  }
}
