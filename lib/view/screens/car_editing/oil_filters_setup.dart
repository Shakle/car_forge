import 'package:flutter/material.dart';

import '../../../core/data/config/app_config.dart';
import '../../../core/data/models/car_filters.dart';
import '../../../core/repository/car/car_repository.dart';
import '../../components/app_general/buttons.dart';
import '../../components/stats/stat_card/oil_filters/filter_check.dart';
import '../../components/stats/stat_card/oil_filters/mileage_check.dart';

class OilFiltersEditingBottomSheet extends StatefulWidget {
  
  @override
  _OilFiltersEditingBottomSheetState createState() => _OilFiltersEditingBottomSheetState();
}

class _OilFiltersEditingBottomSheetState extends State<OilFiltersEditingBottomSheet> {

  @override
  void initState() {
    CarRepository.carOilMaintenanceCreationData = RegularMaintenanceInfo(
      mileage: 0,
      filtersList: [],
    );
    super.initState();
  }

  @override
  void dispose() {
    CarRepository.carOilMaintenanceCreationData = null;
    super.dispose();
  }

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
          ...List<Widget>.generate(CarFilter.values.length, (index) => FilterCheckbox(carFilter: CarFilter.values[index])),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConfig.screenWidth(context) * 0.15),
            child: MileageEditor(),
          ),
          SizedBox(height: 15),
          OvalButton(function: () => CarRepository().addCarMaintenanceData(context), title: 'Готово'),
          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
        ],
      ),
    );
  }
}
