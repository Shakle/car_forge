import 'package:flutter/material.dart';

import '../../../core/data/config/app_config.dart';
import '../../components/app_general/buttons.dart';
import '../../components/stats/stat_card/oil_filters/filter_check.dart';
import '../../components/stats/stat_card/oil_filters/mileage_check.dart';

class OilFiltersEditingBottomSheet extends StatelessWidget {
  
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConfig.screenWidth(context) * 0.15),
            child: MileageEditor(),
          ),
          SizedBox(height: 15),
          FilterCheckbox(carFilter: CarFilter.cabin),
          FilterCheckbox(carFilter: CarFilter.oil),
          FilterCheckbox(carFilter: CarFilter.air),
          FilterCheckbox(carFilter: CarFilter.fuel),
          SizedBox(height: 15),
          OvalButton(function: () {}, title: 'Готово'),
        ],
      ),
    );
  }
}
