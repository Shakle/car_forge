import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationStackState> {
  NavigationBloc() : super(NavigationStackInitial());

  @override
  Stream<NavigationStackState> mapEventToState(NavigationEvent event) async*{
    if (event is NavigationPushed) {
      final List<MaterialPage> newScreensStack = List.from(state.screenStack)
        ..add(event.screen);

      yield NavigationStackCurrent(screenStack: newScreensStack);
    }
  }

}