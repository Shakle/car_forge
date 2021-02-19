import 'package:flutter/material.dart';

import '../components/stats/stat_card/stat_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }
  
  Widget layout(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }

  Widget body() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: StatCard(statCardType: StatCardType.oilService),
      ),
    );
  }

}
