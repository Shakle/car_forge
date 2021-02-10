import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/bloc/navigation/navigation_bloc.dart';
import '../../core/bloc/navigation/navigation_event.dart';
import '../../core/data/config/routes.dart';
import 'arguments/screens_arguments.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.ac_unit),
              onPressed: () => test(context))
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  void test(BuildContext context) {
    BlocProvider.of<NavigationBloc>(context).add(NavigationPushed(
      screen: Routes().materialPage(
          name: Routes.secondScreen,
          screenArguments: ScreenTwoArguments(
            name: 'test',
          ),
      ),
    ));
  }
}
