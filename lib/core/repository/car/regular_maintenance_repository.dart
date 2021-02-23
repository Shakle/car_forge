import 'package:flutter/material.dart';

import '../../../view/components/stats/stat_card/oil_filters/filter_check.dart';

class RegularMaintenanceRepository {

  List<CarFilter> getChangedCarFilters({
    @required List<CarFilter> currentStateCarFilters,
    @required CarFilter editedCarFilter
  }) {
    currentStateCarFilters.contains(editedCarFilter)
        ? currentStateCarFilters.remove(editedCarFilter)
        : currentStateCarFilters.add(editedCarFilter);

    return currentStateCarFilters;
  }
}