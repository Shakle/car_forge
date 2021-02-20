import 'package:flutter/material.dart';

import '../../../../core/data/config/app_config.dart';
import '../../../../core/repository/general/call_pop_up_widgets.dart';
import 'layouts/oil_change.dart';

enum StatCardType {oilService}

class StatCard extends StatelessWidget {

  final StatCardType statCardType;

  const StatCard({@required this.statCardType});

  @override
  Widget build(BuildContext context) {
    return statCard(context);
  }

  Widget statCard(BuildContext context) {
    return ElevatedButton(
      onPressed: () => editOilChange(context),
      child: SizedBox(
          height: 200,
          width: AppConfig.screenWidth(context),
          child: getStatCardLayout(),
      ),
    );
  }

  Widget getStatCardLayout() {
    switch (statCardType) {
      case StatCardType.oilService: return OilChangeStatLayout();
      default: return Container();
    }
  }

  void editOilChange(BuildContext context) {
    PopUpWidgets().showBottomSheet(
        context: context,
        bottomSheetType: BottomSheetType.oilChange
    );
  }
}
