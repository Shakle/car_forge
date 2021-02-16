import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return layout();
  }
  
  Widget layout() {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return Column(
      children: [
        Expanded(flex: 1, child: carImage()),
        Expanded(flex: 2, child: Container()),
      ],
    );
  }

  Widget carImage() {
    return Container(
      color: Colors.brown,
      child: Center(
        child: Icon(Icons.car_repair)
      ),
    );
  }

}
