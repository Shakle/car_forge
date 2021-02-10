import 'package:flutter/material.dart';

import '../../data/config/routes.dart';

abstract class NavigationStackState {
  final List<MaterialPage> screenStack;

  NavigationStackState({
    @required this.screenStack
  }) : assert(screenStack != null && screenStack.isNotEmpty, 'screen stack must not be null or empty');
}

class NavigationStackInitial extends NavigationStackState {
  NavigationStackInitial() : super(screenStack: [Routes().materialPage(name: Routes.homeScreen)]);
}

class NavigationStackCurrent extends NavigationStackState {
  NavigationStackCurrent({@required List<MaterialPage> screenStack}) : super(screenStack: screenStack);
}