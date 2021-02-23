import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/bloc/car/regular_maintenance/car_rm_bloc.dart';
import '../../../../../core/bloc/car/regular_maintenance/car_rm_event.dart';
import '../../../../../core/bloc/car/regular_maintenance/car_rm_state.dart';

class MileageEditor extends StatefulWidget {
  @override
  _MileageEditorState createState() => _MileageEditorState();
}

class _MileageEditorState extends State<MileageEditor> {

  TextEditingController mileageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarRegularMaintenanceBloc, CarRegularMaintenanceState>(
        builder: (context, state) {
          return mileageInput(state);
        }
    );
  }

  Widget mileageInput(CarRegularMaintenanceState state) {
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
        final int mileage = int.parse(text);
        BlocProvider.of<CarRegularMaintenanceBloc>(context).add(MileageChanged(mileage: mileage));
      } on Exception catch (e) {
        mileageController.text = 0.toString();
        debugPrint(e.toString());
      }
    }
  }
}
