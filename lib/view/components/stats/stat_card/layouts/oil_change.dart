import 'package:flutter/material.dart';

import '../../../../../core/data/models/car.dart';

class OilChangeStatLayout extends StatelessWidget {

  final Car car;

  const OilChangeStatLayout({Key key, this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return layout();
  }

  Widget layout() {
    return Stack(
      children: [
        settingsIcon(),
        if (car == null) oilNotSetLayout(),
        if (car != null) oilSetLayout(),
      ],
    );
  }

  Widget oilNotSetLayout() {
    return Center(
      child: Text(
        'Когда вы последний раз меняли\n масло и фильтры?',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget oilSetLayout() {
    return Container();
  }

  Widget settingsIcon() {
    return Positioned(
      top: 15,
      right: 0,
      child: Icon(
          Icons.settings,
          size: 20,
          color: Colors.grey,
      ),
    );
  }

}
