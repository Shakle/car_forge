import 'package:flutter/material.dart';

import '../../../view/components/stats/stat_card/oil_filters/filter_check.dart';
import '../database/extensions.dart';

class RegularMaintenanceInfo {
  final int mileage;
  final List<CarFilter> filtersList;

  RegularMaintenanceInfo({
    @required this.mileage,
    @required this.filtersList
  }) : assert(mileage != null && filtersList != null, 'Maintenance info must have mileage and filters changed');

  RegularMaintenanceInfo fromJson(Map<String, dynamic> json) {
    return RegularMaintenanceInfo(
        mileage: json['mileage'],
        filtersList: json['filters_list']
    );
  }

  Map<String, dynamic> toJson() => {
    'mileage': mileage,
    'filters_list': filtersList,
  }.removeNullValues();
}