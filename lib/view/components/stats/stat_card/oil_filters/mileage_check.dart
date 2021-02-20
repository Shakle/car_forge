import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/data/models/car_filters.dart';
import '../../../../../core/repository/car/car_repository.dart';

class MileageEditor extends StatefulWidget {
  @override
  _MileageEditorState createState() => _MileageEditorState();
}

class _MileageEditorState extends State<MileageEditor> {

  TextEditingController mileageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return mileageInput();
  }

  Widget mileageInput() {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      maxLength: 7,
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        counterText: '',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10)
        ),
        labelText: 'Пробег',
        suffixText: 'км',
        alignLabelWithHint: true,
      ),
      onChanged: parseMileageAndPrepareForSaving,
    );
  }

  void parseMileageAndPrepareForSaving(String text) {
    if (text != null && text.isNotEmpty) {
      try {
        final int mileage = int.tryParse(text);

        CarRepository.carOilMaintenanceCreationData = RegularMaintenanceInfo(
          mileage: mileage,
          filtersList: CarRepository.carOilMaintenanceCreationData.filtersList,
        );
      } on Exception catch (e) {
        mileageController.text = 0.toString();
        debugPrint(e.toString());
      }
    }
  }
}
