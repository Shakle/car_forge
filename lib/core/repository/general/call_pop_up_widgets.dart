import 'package:flutter/material.dart';

import '../../../view/screens/car_editing/oil_filters_setup.dart';

enum BottomSheetType {oilChange}

class PopUpWidgets {

  Future<void> showBottomSheet({
    @required BuildContext context,
    @required BottomSheetType bottomSheetType
  }) async {
    return showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: (context) {
          switch (bottomSheetType) {
            case BottomSheetType.oilChange: return OilFiltersEditingBottomSheet();
            default: return Container();
          }
        }
    );
  }
}